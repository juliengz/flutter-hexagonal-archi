import 'package:dio/dio.dart';
import 'package:flutter_api_test/providers/http_client/api_call_logging_interceptor.dart';

const String baseUrl = "https://jsonplaceholder.typicode.com/";

Dio createHttpClient() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Accept": "application/json",
      },
    ),
  );
  dio.interceptors.add(APICallLoggingInterceptor());
  return dio;
}
