import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/interfaces/user_repository_interface.dart';
import 'package:flutter_api_test/core/authentication/responses/requests_status.dart';

abstract class AuthenticationManagerInterface {
  Future<RequestStatus> signin(String login, String password);
  void signout();
  bool isAuthenticated();
}
