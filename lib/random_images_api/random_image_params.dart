import '../utils/api/implementation/simple_api/simple_params.dart';

class RandomImagesParams extends SimpleParameters {
  String? get rating => queryParams["rating"];
  set rating(String? val) {
    super.queryParams["rating"] = val!;
  }

  String? get isOriginal => queryParams["is_original"];
  set isOriginal(String? val) {
    super.queryParams["is_original"] = val!;
  }

  String? get isAnimated => queryParams["is_animated"];
  set isAnimated(String? val) {
    super.queryParams["is_animated"] = val!;
  }

  String? get limit => queryParams["limit"];
  set limit(String? val) {
    super.queryParams["limit"] = val!;
  }

  String? get tag => queryParams["tag"];
  set tag(String? val) {
    super.queryParams["tag"] = val!;
  }

    @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RandomImagesParams) return false;
    return super == other;
  }

  @override
  int get hashCode {
    return super.hashCode;
  }

}