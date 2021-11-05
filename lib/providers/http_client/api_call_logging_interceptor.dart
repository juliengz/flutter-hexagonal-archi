import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_api_test/main.dart';

const noData = "n/a";

class APICallLoggingInterceptor extends Interceptor {
  APICallLoggingInterceptor();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logger.i({
      options.method: options.uri,
      "Body": options.data ?? noData,
    });

    return handler.next(options);
  }

  @override
  Future onError(DioError err, handler) async {
    return handler.next(err);
  }

  @override
  Future onResponse(response, handler) async {
    logger.i({
      "statusCode": response.statusCode,
    });

    return handler.next(response);
  }
}
