import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/routes/app_pages.dart';
import 'package:flutter_api_test/app/routes/app_routes.dart';
import 'package:flutter_api_test/app/themes/app_theme.dart';
import 'package:flutter_api_test/dependencies_injection.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

void logme(String text) {
  developer.log(
    text,
    name: 'APPLICATION',
  );
}

void main() {
  injectDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.dashboardRouteName,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
