import 'package:flutter_api_test/app/pages/authentication/bindings/signin_binding.dart';
import 'package:flutter_api_test/app/pages/authentication/views/signin_page.dart';
import 'package:flutter_api_test/app/pages/dashboard/bindings/dashboard_binding.dart';
import 'package:flutter_api_test/app/pages/dashboard/views/dashboard_page.dart';
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
      name: AppRoutes.dashboardRouteName,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
