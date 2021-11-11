import 'package:flutter_api_test/core/authentication/responses/authentication_response.dart';

abstract class AuthenticationManagerInterface {
  Future<AuthenticationResponse> signin(String login, String password);
  void signout();
  bool isAuthenticated();
}
