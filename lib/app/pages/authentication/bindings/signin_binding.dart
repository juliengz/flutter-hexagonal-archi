import 'package:flutter_api_test/app/pages/authentication/controllers/signin_controller.dart';
import 'package:get/get.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController(
          authenticationManager: Get.find(),
        ));
  }
}
