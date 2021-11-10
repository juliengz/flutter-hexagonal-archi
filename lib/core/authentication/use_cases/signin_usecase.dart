import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/interfaces/authentication_manager.dart';
import 'package:flutter_api_test/core/authentication/responses/requests_status.dart';

class SigninUseCase {
  final AuthenticationManagerInterface authenticationManager;

  SigninUseCase(this.authenticationManager);

  Future<RequestStatus> exec(String login, String password) async {
    return await authenticationManager.signin(login, password);
  }
}
