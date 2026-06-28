import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce/core/handler/handler_api_http.dart';
import 'package:ecommerce/core/network/resulet_api.dart';

class ApiCallMethods {
  final String baseUrl;
  final Map<String, String>? defaultHeaders;

  ApiCallMethods({required this.baseUrl, this.defaultHeaders});

  Uri _buildUri(String endpoint) {
    return Uri.parse('$baseUrl$endpoint');
  }

  Map<String, String> _buildHeaders(Map<String, String>? customHeaders) {
    return {
      'Content-Type': 'application/json',
      ...?defaultHeaders,
      ...?customHeaders,
    };
  }

  Future<ResultApi<T>> get<T>({
    required String endpoint,
    required T Function(String body) mapper,
    Map<String, String>? headers,
  }) async {
    return ApiHandlerHttpE.execute<T>(
      () => http.get(_buildUri(endpoint), headers: _buildHeaders(headers)),
      mapper,
    );
  }

  Future<ResultApi<T>> post<T>({
    required String endpoint,
    required T Function(String body) mapper,
    Object? body,
    Map<String, String>? headers,
  }) async {
    return ApiHandlerHttpE.execute<T>(
      () => http.post(
        _buildUri(endpoint),
        headers: _buildHeaders(headers),
        body: body is Map ? json.encode(body) : body,
      ),
      mapper,
    );
  }

  Future<ResultApi<T>> put<T>({
    required String endpoint,
    required T Function(String body) mapper,
    Object? body,
    Map<String, String>? headers,
  }) async {
    return ApiHandlerHttpE.execute<T>(
      () => http.put(
        _buildUri(endpoint),
        headers: _buildHeaders(headers),
        body: body is Map ? json.encode(body) : body,
      ),
      mapper,
    );
  }

  Future<ResultApi<T>> delete<T>({
    required String endpoint,
    required T Function(String body) mapper,
    Object? body,
    Map<String, String>? headers,
  }) async {
    return ApiHandlerHttpE.execute<T>(
      () => http.delete(
        _buildUri(endpoint),
        headers: _buildHeaders(headers),
        body: body is Map ? json.encode(body) : body,
      ),
      mapper,
    );
  }
}
