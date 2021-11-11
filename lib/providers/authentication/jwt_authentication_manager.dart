import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/interfaces/authentication_manager_interface.dart';
import 'package:flutter_api_test/core/authentication/interfaces/authentication_repository_interface.dart';
import 'package:flutter_api_test/core/authentication/responses/authentication_response.dart';
import 'package:flutter_api_test/providers/api/authentication_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtAuthenticationManager implements AuthenticationManagerInterface {
  final AuthenticationRepositoryInterface authenticationRepository;
  final storage = const FlutterSecureStorage();

  JwtAuthenticationManager({required this.authenticationRepository});

  @override
  Future<AuthenticationResponse> signin(String login, String password) async {
    try {
      Map<String, dynamic>? tokens =
          await authenticationRepository.signin(login, password);

      await storage.write(key: 'accessToken', value: tokens?['accessToken']);
      await storage.write(key: 'refreshToken', value: tokens?['refreshToken']);

      User? user = await authenticationRepository.getUser();

      return AuthenticationResponseSuccess(data: user);
    } on BadCredentialException catch (e) {
      return AuthenticationResponseFailure(error: e);
    }
  }

  @override
  void signout() async {
    await storage.delete(key: 'accessToken');
    await storage.delete(key: 'refreshToken');
  }

  @override
  bool isAuthenticated() {
    return false;
  }
}
