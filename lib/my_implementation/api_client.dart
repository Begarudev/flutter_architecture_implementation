import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;

  ApiClient({required this.client});

  Future<Map<String, dynamic>> get(
      {required String url, Map<String, String>? headers, Map<String, String>? params}) async {
    final uri = Uri.parse(url).replace(queryParameters: params);
    final response = await client.get(uri, headers: headers);
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> post(
      {required String url, Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final uri = Uri.parse(url);
    final response = await client.post(uri, headers: headers, body: jsonEncode(body));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> put(
      {required String url, Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final uri = Uri.parse(url);
    final response = await client.put(uri, headers: headers, body: jsonEncode(body));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> delete(
      {required String url, Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final uri = Uri.parse(url);
    final response = await client.delete(uri, headers: headers, body: jsonEncode(body));
    return _processResponse(response);
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Error: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
