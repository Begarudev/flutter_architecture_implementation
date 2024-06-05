import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_client.dart';

part 'api_service.g.dart';

@Riverpod(keepAlive: true)
http.Client httpClient(HttpClientRef ref) {
  return http.Client();
}

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  final client = ref.watch(httpClientProvider);
  return ApiClient(client: client);
}

@riverpod
ApiService apiService(ApiServiceRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ApiService(apiClient: apiClient);
}

class ApiService {
  final ApiClient apiClient;
  Future? ongoingRequest;

  ApiService({required this.apiClient});

  Future<T> fetchData<T>({
    required String url,
    required T Function(String) fromJson,
    Map<String, String>? headers,
    Map<String, String>? params,
    bool allowConcurrentRequests = false,
    bool resetStateOnRefresh = false,
  }) async {
    if (!allowConcurrentRequests && ongoingRequest != null) {
      // If there's an ongoing request and concurrent requests are not allowed, wait for the ongoing request to finish
      await ongoingRequest;
    }
    if (resetStateOnRefresh) {
      // Add logic to reset state
      // This will depend on how you're managing state in your application
    }
    ongoingRequest = apiClient.get(url: url, headers: headers, params: params);
    final response = await ongoingRequest;
    return fromJson(response);
  }

  Future<T> postData<T>(
      {required String url,
      required T Function(String) fromJson,
      Map<String, String>? headers,
      Map<String, dynamic>? body}) async {
    final response =
        await apiClient.post(url: url, headers: headers, body: body);
    return fromJson(response);
  }

  Future<T> putData<T>(
      {required String url,
      required T Function(String) fromJson,
      Map<String, String>? headers,
      Map<String, dynamic>? body}) async {
    final response =
        await apiClient.put(url: url, headers: headers, body: body);
    return fromJson(response);
  }

  Future<T> deleteData<T>(
      {required String url,
      required T Function(String) fromJson,
      Map<String, String>? headers,
      Map<String, dynamic>? body}) async {
    final response =
        await apiClient.delete(url: url, headers: headers, body: body);
    return fromJson(response);
  }

  // Similar methods for PUT and DELETE can be added here.
}
