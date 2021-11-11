import 'package:flutter/widgets.dart';
import 'package:flutter_api_test/core/authentication/responses/authentication_response.dart';
import 'package:flutter_api_test/core/authentication/use_cases/signin_usecase.dart';
import 'package:flutter_api_test/main.dart';
import 'package:flutter_api_test/providers/authentication/jwt_authentication_manager.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final JwtAuthenticationManager authenticationManager;
  final storage = const FlutterSecureStorage();

  SigninController({required this.authenticationManager});

  signin(GlobalKey<FormBuilderState> formKey) async {
    formKey.currentState?.save();

    if (formKey.currentState!.validate()) {
      String email = formKey.currentState!.fields['login']!.value;
      String password = formKey.currentState!.fields['password']!.value;

      AuthenticationResponse response =
          await SigninUseCase(authenticationManager).exec(email, password);

      response.onSuccess((data) {
        logger.i(data);
      }).onError((data) {
        stackTrace.e(data);
      });
    }
  }
}
