import 'package:flutter_api_test/app/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController(
          userRepository: Get.find(),
          userState: Get.find(),
          authenticationManager: Get.find(),
        ));
  }
}
