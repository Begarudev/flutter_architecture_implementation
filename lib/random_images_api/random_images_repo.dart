// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_architecture_implementation/random_images_api/random_images_model.dart';
import 'package:flutter_architecture_implementation/utils/api/core/http_method.dart';
import 'package:flutter_architecture_implementation/utils/api/implementation/simple_api/abstract_simple_params.dart';
import 'package:flutter_architecture_implementation/utils/api/implementation/simple_api/simple_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../my_implementation/api_service.dart';

part 'random_images_repo.g.dart';

// @riverpod
// class Example extends _$Example with ExampleMixin {
//   @override
//   Future<RandomImageModel> build() async {
//     Map<String, String> headersList = {};
//     var url = Uri.parse('https://api.nekosapi.com/v3/images/random');
//     var req = http.Request('GET', url);
//     req.headers.addAll(headersList);
//     var res = await req.send();
//     final resBody = await res.stream.bytesToString();
//     if (res.statusCode >= 200 && res.statusCode < 300) {
//       log(resBody);
//     } else {
//       log(res.reasonPhrase!);
//     }
//     return randomImageFromJson(resBody);
//   }
// }

@riverpod
class RandomImage extends _$RandomImage {
  @override
  Future<RandomImageModel> build(
      {required AbstractSimpleParameters params}) async {
    return SpecificApi<RandomImageModel, AbstractSimpleParameters>(
      ref,
      fromJson: RandomImageModel.fromJson,
      httpMethod: HTTPMethod.get,
      newParams: params,
    ).run();
  }
}

class RandomImagesParams extends SimpleParameters {
  String? get rating => body["rating"];
  set rating(String? val) {
    super.queryParams["rating"] = val!;
  }

  bool? get isOriginal => body["is_original"];
  set isOriginal(bool? val) {
    super.queryParams["is_original"] = val!;
  }

  bool? get isAnimated => body["is_animated"];
  set isAnimated(bool? val) {
    super.queryParams["is_animated"] = val!;
  }

  int? get limit => body["limit"];
  set limit(int? val) {
    super.queryParams["limit"] = val!;
  }

  int? get tag => body["tag"];
  set tag(int? val) {
    super.queryParams["tag"] = val!;
  }
}

class SpecificApi<MODEL, PARAM extends AbstractSimpleParameters>
    extends CustomApi<MODEL, PARAM> {
  PARAM newParams;
  SpecificApi(super.ref,
      {required super.fromJson,
      required super.httpMethod,
      required this.newParams})
      : super(
            url: "https://api.nekosapi.com/v3/images/random",
            params: newParams);
}

abstract class CustomApi<MODEL, PARAM extends AbstractSimpleParameters> {
  final Ref ref;
  final String url;
  final HTTPMethod httpMethod;
  final bool allowConcurrentRequests;
  final bool resetStateOnRefresh;
  final PARAM params;
  final bool resetParamsOnExecute;
  final bool printParams;

  final MODEL Function(Map<String, dynamic>) fromJson;

  const CustomApi(
    this.ref, {
    required this.fromJson,
    required this.url,
    required this.httpMethod,
    this.allowConcurrentRequests = false,
    this.resetStateOnRefresh = false,
    required this.params,
    this.resetParamsOnExecute = false,
    this.printParams = false,
  });

  Future<MODEL> run() async {
    String finalUrl = params.getFormattedUrl(url);
    if (finalUrl.endsWith('#')) {
      finalUrl = removeLastLetter(finalUrl);
    } else {
      if (!finalUrl.endsWith('/') &&
          httpMethod.value == HTTPMethod.post.value) {
        log("httpmethod is equal to post [debug]");
        //finalUrl += '/';
      }
    }

    if (params.getFiles().isNotEmpty) {
      var mpRequest =
          http.MultipartRequest(httpMethod.value, Uri.parse(finalUrl));
      mpRequest.headers.clear();
      mpRequest.headers.addAll(params.getHeaders());
      mpRequest.headers.addAll({
        "Content-Type": 'multipart/form-data',
//        "Accept": 'application/json'
      });
//    request.fields.addAll(other)
      params.getBodyUnencoded().forEach((key, value) {
        mpRequest.fields[key] = value;
        //jsonEncode(value);
      });
      var files = params.getFiles();

      for (int i = 0; i < params.getFiles().keys.length; i++) {
        var key = files.keys.elementAt(i);
        mpRequest.files
            .add(await http.MultipartFile.fromPath(key, files[key]!));
      }
      // request = mpRequest;
    } else {
      var simpleReq = http.Request(httpMethod.value, Uri.parse(finalUrl));
      simpleReq.headers.clear();
      simpleReq.headers.addAll(params.getHeaders());
      simpleReq.headers.addAll({"Content-Type": 'application/json'});
      simpleReq.body = params.getBodyEncoded();
      // request = simpleReq;
    }
    final apiService = ref.read(apiServiceProvider);
    fromJsonFunc(json) => fromJson(json);

    final methodToFunction = {
      HTTPMethod.get: apiService.fetchData<MODEL>,
      HTTPMethod.post: apiService.postData<MODEL>,
      HTTPMethod.put: apiService.putData<MODEL>,
      HTTPMethod.delete: apiService.deleteData<MODEL>,
    };

    if (!methodToFunction.containsKey(httpMethod)) {
      throw Exception('HTTP method $httpMethod not implemented');
    }

    return methodToFunction[httpMethod]!(url: finalUrl, fromJson: fromJsonFunc);
  }
}

extension Something<MODEL> on AsyncValue<MODEL> {
  Widget displayWidget(Widget Function(MODEL data) child) {
    return when(
      data: (data) {
        return child(data);
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (error, stackTrace) {
        return Text('Error: $error');
      },
    );
  }
}

String removeLastLetter(String input) {
  if (input.isEmpty) {
    return input; // Handle empty string case if needed
  }

  return input.substring(0, input.length - 1);
}
