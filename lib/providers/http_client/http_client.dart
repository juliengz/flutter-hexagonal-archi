import 'package:dio/dio.dart';
import 'package:flutter_api_test/providers/http_client/interceptors/access_token_handler_interceptor.dart';
import 'package:flutter_api_test/providers/http_client/interceptors/http_request_logging_interceptor.dart';

Dio createHttpClient() {
  Dio dio = Dio(
    BaseOptions(
      headers: {
        "Accept": "application/json",
      },
    ),
  );
  dio.interceptors.add(AccessTokenHandlerInterceptor());
  dio.interceptors.add(HTTPRequestLoggingInterceptor());
  return dio;
}
