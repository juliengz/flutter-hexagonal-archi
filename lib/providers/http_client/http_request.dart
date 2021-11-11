import 'package:flutter_api_test/providers/http_client/http_client.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class HttpRequest {
  final String _baseUrl = "http://10.0.2.2:8000/";
  final String requestedUrl;
  final Dio _client = createHttpClient();
  final Map? data;

  HttpRequest({required this.requestedUrl, this.data});

  Future<dynamic> get({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      final response = await _client.get(_baseUrl + requestedUrl);
      if (onSuccess != null) return onSuccess(response);
    } on DioError catch (error) {
      if (onError != null) return onError(error);
    }
  }

  Future<dynamic> post({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      var response = await _client.post(_baseUrl + requestedUrl, data: data);
      if (onSuccess != null) return onSuccess(response);
    } on DioError catch (error) {
      if (onError != null) return onError(error);
    }
  }
}
