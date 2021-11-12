import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/interfaces/authentication_manager_interface.dart';
import 'package:flutter_api_test/core/authentication/responses/authentication_response.dart';

class SigninUseCase {
  final AuthenticationManagerInterface authenticationManager;

  SigninUseCase(this.authenticationManager);

  Future<AuthenticationResponse<dynamic>> exec(
      String login, String password) async {
    return await authenticationManager.signin(login, password);
  }
}
