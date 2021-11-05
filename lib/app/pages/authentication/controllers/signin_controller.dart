import 'package:flutter/widgets.dart';
import 'package:flutter_api_test/core/user/use_cases/signin_usecase.dart';
import 'package:flutter_api_test/main.dart';
import 'package:flutter_api_test/providers/api/user_repository.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final UserRepository userRepository;
  final storage = const FlutterSecureStorage();

  SigninController({required this.userRepository});

  signin(GlobalKey<FormBuilderState> formKey) async {
    formKey.currentState?.save();

    if (formKey.currentState!.validate()) {
      String email = formKey.currentState!.fields['login']!.value;
      String password = formKey.currentState!.fields['password']!.value;

      var response = await SigninUseCase(userRepository).exec(email, password);
      logger.i(response);
    }
  }
}
