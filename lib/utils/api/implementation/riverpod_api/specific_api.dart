import '../../../urls.dart';
import '../simple_api/abstract_simple_params.dart';
import '../simple_api/custom_api.dart';

class SpecificApi<MODEL, PARAM extends AbstractSimpleParameters>
    extends CustomApi<MODEL, PARAM> {
  PARAM newParams;
  String urlPart;
  SpecificApi(super.ref,
      {required super.factory,
      required super.httpMethod,
      required this.newParams,
      required this.urlPart})
      : super(url: URLs.complete(urlPart), params: newParams);
}
