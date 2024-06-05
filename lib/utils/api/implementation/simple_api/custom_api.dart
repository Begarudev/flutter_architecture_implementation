import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

import '../../../../my_implementation/api_service.dart';
import '../../core/http_method.dart';
import 'abstract_simple_params.dart';

abstract class CustomApi<MODEL, PARAM extends AbstractSimpleParameters> {
  final Ref ref;
  final String url;
  final HTTPMethod httpMethod;
  final bool allowConcurrentRequests;
  final bool resetStateOnRefresh;
  final PARAM params;
  final bool resetParamsOnExecute;
  final bool printParams;

  // final MODEL Function(String) fromJson;
  final MODEL Function(String) factory;

  const CustomApi(
    this.ref, {
    required this.factory,
    // required this.fromJson,
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
    switch (httpMethod) {
      case HTTPMethod.get:
        return apiService.fetchData<MODEL>(url: finalUrl, fromJson: factory);
      case HTTPMethod.post:
        return apiService.postData<MODEL>(url: finalUrl, fromJson: factory);
      case HTTPMethod.put:
        return apiService.putData<MODEL>(url: finalUrl, fromJson: factory);
      case HTTPMethod.delete:
        return apiService.deleteData<MODEL>(url: finalUrl, fromJson: factory);
      default:
        throw Exception('Not implemented');
    }
  }
}

String removeLastLetter(String input) {
  if (input.isEmpty) {
    return input; // Handle empty string case if needed
  }

  return input.substring(0, input.length - 1);
}
