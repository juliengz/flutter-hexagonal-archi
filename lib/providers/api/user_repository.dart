import 'package:dio/dio.dart';
import 'package:flutter_api_test/core/authentication/interfaces/user_repository_interface.dart';
import 'package:flutter_api_test/providers/http_client/http_client.dart';

class BadCredentialException implements Exception {
  String cause;
  BadCredentialException(this.cause);
}

class UserRepository implements UserRepositoryInterface {
  @override
  Future<Map<String, String>?> signin(String login, String password) async {
    var dio = createHttpClient();

    try {
      var response = await dio.post('http://192.168.1.46:8000/auth',
          data: {'login': login, 'password': password});

      Map mappedResponse = response.data;
      return {
        "accessToken": mappedResponse['accessToken'],
        "refreshToken": mappedResponse['refreshToken'],
      };
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw BadCredentialException('test');
      }
    }
  }
}
