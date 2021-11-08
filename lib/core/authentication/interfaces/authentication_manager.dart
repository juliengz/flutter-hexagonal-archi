import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/interfaces/user_repository_interface.dart';

abstract class AuthenticationManagerInterface {
  Future<User> signin(String login, String password);
  void signout();
  bool isAuthenticated();
}
