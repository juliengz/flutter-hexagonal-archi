import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_api_test/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccessTokenHandlerInterceptor extends Interceptor {
  final storage = const FlutterSecureStorage();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? accessToken = await storage.read(key: "accessToken");

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      logger.i({"token": accessToken});
    }

    return handler.next(options);
  }
}
