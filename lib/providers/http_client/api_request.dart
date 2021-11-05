import 'package:dio/dio.dart';
import 'package:flutter_api_test/providers/http_client/http_client.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;

  ApiRequest({
    required this.url,
    this.data,
  });

  Dio _dio() {
    return createHttpClient();
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().get(url, queryParameters: data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
