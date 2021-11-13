import 'package:flutter_api_test/core/authentication/interfaces/authentication_manager_interface.dart';

class SignoutUseCase {
  final AuthenticationManagerInterface authenticationManager;

  SignoutUseCase(this.authenticationManager);

  Future<void> exec() async {
    return await authenticationManager.signout();
  }
}
