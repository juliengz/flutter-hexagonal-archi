import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/interfaces/authentication_repository_interface.dart';
import 'package:flutter_api_test/main.dart';
import 'package:flutter_api_test/providers/http_client/http_request.dart';

enum exeptionCauses { badCredential }

class BadCredentialException implements Exception {
  exeptionCauses cause;
  BadCredentialException(this.cause);
}

class AuthenticationRepository implements AuthenticationRepositoryInterface {
  @override
  Future<Map<String, dynamic>?> signin(String login, String password) async {
    var response = await HttpRequest(
        requestedUrl: 'auth',
        data: {'login': login, 'password': password}).post(
      onSuccess: (response) {
        Map mappedResponse = response.data;
        return {
          "accessToken": mappedResponse['accessToken'],
          "refreshToken": mappedResponse['refreshToken'],
        };
      },
      onError: (error) {
        if (error.response?.statusCode == 401) {
          logger.d(error.response?.statusCode);
          throw BadCredentialException(exeptionCauses.badCredential);
        }
      },
    );

    return response;
  }

  @override
  Future<User?> getUser() async {
    var response = await HttpRequest(requestedUrl: 'me').get(
      onSuccess: (response) {
        return User.fromJson(response.data);
      },
      onError: (error) {
        if (error.response?.statusCode == 401) {
          logger.d(error.response?.statusCode);
          throw BadCredentialException(exeptionCauses.badCredential);
        }
      },
    );

    return response;
  }
}
