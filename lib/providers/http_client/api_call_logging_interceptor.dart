import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

const noData = "n/a";

class APICallLoggingInterceptor extends Interceptor {
  final Logger logger = Logger(printer: PrettyPrinter());
  final Logger loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0));

  APICallLoggingInterceptor();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    Map log = {
      _formatLabel(options.method): options.uri,
      _formatLabel("Body"): options.data ?? noData,
    };

    loggerNoStack.i(_formatContent(log));

    return handler.next(options);
  }

  @override
  Future onError(DioError err, handler) async {
    return handler.next(err);
  }

  @override
  Future onResponse(response, handler) async {
    return handler.next(response);
  }

  String _formatLabel(String label) {
    return label.padRight(20, ' ');
  }

  StringBuffer _formatContent(Map log) {
    var buffer = StringBuffer();
    log.forEach((k, v) => buffer.writeln('$k: $v'));
    return buffer;
  }
}
