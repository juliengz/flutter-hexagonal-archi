import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_test/app/routes/app_routes.dart';
import 'package:flutter_api_test/core/authentication/exceptions/bad_credential_exception.dart';
import 'package:flutter_api_test/core/authentication/responses/authentication_response.dart';
import 'package:flutter_api_test/core/authentication/use_cases/signin_usecase.dart';
import 'package:flutter_api_test/providers/authentication/jwt_authentication_manager.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final JwtAuthenticationManager authenticationManager;
  RxBool showError = RxBool(false);

  SigninController({required this.authenticationManager});

  void signin(GlobalKey<FormBuilderState> formKey) async {
    formKey.currentState?.save();

    if (formKey.currentState!.validate()) {
      String email = formKey.currentState!.fields['login']!.value;
      String password = formKey.currentState!.fields['password']!.value;

      AuthenticationResponse<dynamic> response =
          await SigninUseCase(authenticationManager).exec(email, password);

      response.onSuccess((data) {
        Get.offNamed(AppRoutes.homeRouteName);
      }).onError((error) {
        if (error is BadCredentialException) {
          Get.snackbar(
            'Sign in error',
            'The login or password are wrong.',
          );
        }
      });
    }
  }
}
