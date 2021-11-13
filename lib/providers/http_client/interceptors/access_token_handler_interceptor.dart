import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_api_test/main.dart';
import 'package:get_storage/get_storage.dart';

class AccessTokenHandlerInterceptor extends Interceptor {
  final box = GetStorage();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? accessToken = box.read("accessToken");

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }
}
