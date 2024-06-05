import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'abstract_simple_params.dart';

class SimpleParameters extends AbstractSimpleParameters {
  @protected
  Map<String, String> headers = {};
  @protected
  Map<String, dynamic> body = {};
  @protected
  Map<String, String> queryParams = {};
  @protected
  Map<String, int> pathParams = {};
  @protected
  Map<String, String> files = {};

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SimpleParameters &&
        const DeepCollectionEquality().equals(headers, other.headers) &&
        const DeepCollectionEquality().equals(body, other.body) &&
        const DeepCollectionEquality().equals(queryParams, other.queryParams) &&
        const DeepCollectionEquality().equals(pathParams, other.pathParams) &&
        const DeepCollectionEquality().equals(files, other.files) &&
        paginatedOverridenUrl == other.paginatedOverridenUrl;
  }

  @override
  int get hashCode {
    return const DeepCollectionEquality().hash(headers) ^
        const DeepCollectionEquality().hash(body) ^
        const DeepCollectionEquality().hash(queryParams) ^
        const DeepCollectionEquality().hash(pathParams) ^
        const DeepCollectionEquality().hash(files) ^
        paginatedOverridenUrl.hashCode;
  }

  //  @protected
  //  String? suburl;
  @protected
  String? paginatedOverridenUrl;

  @override
  String getBodyEncoded() {
    return jsonEncode(body);
  }

  @override
  Map<String, String> getHeaders() {
    return <String, String>{}..addAll(headers);
  }

  @override
  String getFormattedUrl(String raw) {
    if (paginatedOverridenUrl != null) {
      return paginatedOverridenUrl!;
    }

    String res = raw;
    pathParams.forEach((key, value) {
      res = res.replaceAll('{$key}', value.toString());
    });

    if (queryParams.isNotEmpty) {
      String res = "$raw?";
      queryParams.forEach((key, value) {
        res += "$key=$value&";
      });

      return res;
    } else {
      return raw;
    }
  }

  @override
  String? get overriddenUrl => null;

  @override
  void reset() {
    headers = {};
    body = {};
    queryParams = {};
    pathParams = {};
  }

  @override
  Map<String, dynamic> getBodyUnencoded() {
    return body;
  }

  @override
  Map<String, String> getFiles() {
    return files;
  }
}
