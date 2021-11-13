import 'package:flutter_api_test/core/authentication/responses/authentication_response.dart';

abstract class AuthenticationManagerInterface {
  Future<AuthenticationResponse<dynamic>> signin(String login, String password);
  Future<void> signout();
  bool isAuthenticated();
  Future<void> handleAuthenticationState();
}
