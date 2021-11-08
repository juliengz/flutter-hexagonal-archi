import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/interfaces/authentication_manager.dart';

class SigninUseCase {
  final AuthenticationManagerInterface authenticationManager;

  SigninUseCase(this.authenticationManager);

  Future<User> exec(String login, String password) async {
    return await authenticationManager.signin(login, password);
  }
}
