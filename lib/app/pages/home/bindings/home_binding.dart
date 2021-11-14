import 'package:flutter_api_test/app/pages/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
          userRepository: Get.find(),
          userState: Get.find(),
          authenticationManager: Get.find(),
        ));
  }
}
