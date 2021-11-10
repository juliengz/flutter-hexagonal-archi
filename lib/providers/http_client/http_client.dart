import 'package:dio/dio.dart';
import 'package:flutter_api_test/providers/http_client/api_call_logging_interceptor.dart';

Dio createHttpClient() {
  Dio dio = Dio(
    BaseOptions(
      headers: {
        "Accept": "application/json",
      },
    ),
  );
  dio.interceptors.add(APICallLoggingInterceptor());
  return dio;
}
