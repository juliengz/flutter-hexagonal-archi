import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/routes/app_pages.dart';
import 'package:flutter_api_test/app/routes/app_routes.dart';
import 'package:flutter_api_test/app/themes/app_theme.dart';
import 'package:flutter_api_test/dependencies_injection.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(printer: PrettyPrinter(methodCount: 0));
Logger stackTrace = Logger(printer: PrettyPrinter());

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
