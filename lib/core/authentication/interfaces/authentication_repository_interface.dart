import 'package:flutter_api_test/core/authentication/entities/user.dart';

abstract class AuthenticationRepositoryInterface {
  Future<Map<String, dynamic>?> signin(String login, String password);
  Future<User?> getUser();
}
