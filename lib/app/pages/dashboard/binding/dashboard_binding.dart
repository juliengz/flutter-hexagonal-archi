import 'package:flutter_api_test/app/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController(
          postRepository: Get.find(),
        ));
    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<AccountController>(() => AccountController());
    // Get.lazyPut<PostsController>(() => PostsController());
  }
}
