import 'package:flutter_api_test/app/pages/authentication/bindings/signin_binding.dart';
import 'package:flutter_api_test/app/pages/authentication/views/signin_page.dart';
import 'package:flutter_api_test/app/pages/home/bindings/home_binding.dart';
import 'package:flutter_api_test/app/pages/home/views/home_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.signinRouteName,
      page: () => SigninPage(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: AppRoutes.homeRouteName,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
