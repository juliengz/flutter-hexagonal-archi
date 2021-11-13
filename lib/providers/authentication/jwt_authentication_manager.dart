import 'package:flutter_api_test/core/authentication/interfaces/authentication_manager_interface.dart';
import 'package:flutter_api_test/core/authentication/interfaces/authentication_repository_interface.dart';
import 'package:flutter_api_test/core/authentication/responses/authentication_response.dart';
import 'package:flutter_api_test/providers/api/authentication_repository.dart';
import 'package:flutter_api_test/providers/state/user_state.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JwtAuthenticationManager implements AuthenticationManagerInterface {
  final AuthenticationRepositoryInterface authenticationRepository;
  final box = GetStorage();

  final UserState userState = Get.find();

  JwtAuthenticationManager({required this.authenticationRepository});

  @override
  Future<AuthenticationResponse<dynamic>> signin(
      String login, String password) async {
    try {
      Map<String, dynamic>? tokens =
          await authenticationRepository.signin(login, password);

      await box.write('accessToken', tokens['accessToken']);
      await box.write('refreshToken', tokens['refreshToken']);

      userState.user = await authenticationRepository.getUser();

      return AuthenticationResponseSuccess(data: 'signin success');
    } on BadCredentialException catch (e) {
      return AuthenticationResponseFailure(error: e);
    }
  }

  @override
  void signout() async {
    await box.remove('accessToken');
    await box.remove('refreshToken');
  }

  @override
  bool isAuthenticated() {
    return userState.user != null;
  }

  @override
  handleAuthenticationState() async {
    String? accessToken = box.read('accessToken');

    if (accessToken != null) {
      try {
        userState.user = await authenticationRepository.getUser();
      } catch (e) {
        signout();
      }

      //TODO: handle token refresh
    }
  }
}
