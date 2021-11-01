import 'package:flutter_api_test/app/pages/dashboard/binding/dashboard_binding.dart';
import 'package:flutter_api_test/app/pages/dashboard/pages/dashboard_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.dashboardRouteName,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
