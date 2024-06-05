  // ignore_for_file: public_member_api_docs, sort_constructors_first
  import 'package:flutter_architecture_implementation/random_images_api/random_images_model.dart';
  import 'package:flutter_architecture_implementation/utils/api/core/http_method.dart';
  import 'package:flutter_architecture_implementation/utils/api/implementation/simple_api/simple_params.dart';
  import 'package:flutter_architecture_implementation/utils/factory_utils.dart';
  import 'package:riverpod_annotation/riverpod_annotation.dart';

  import '../utils/api/implementation/riverpod_api/specific_api.dart';

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
        {required SimpleParameters params, required String urlPart}) async {
      return SpecificApi<RandomImageModel, SimpleParameters>(
        ref,
        factory: FactoryUtils.modelFromString(RandomImageModel.fromJson),
        httpMethod: HTTPMethod.get,
        newParams: params,
        urlPart: urlPart,
      ).run();
    }
  }