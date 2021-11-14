import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/routes/app_pages.dart';
import 'package:flutter_api_test/app/routes/app_routes.dart';
import 'package:flutter_api_test/app/themes/app_theme.dart';
import 'package:flutter_api_test/dependencies_injection.dart';
import 'package:flutter_api_test/providers/authentication/jwt_authentication_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(printer: PrettyPrinter(methodCount: 0));
Logger stackTrace = Logger(printer: PrettyPrinter());

Future<void> main() async {
  injectDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(App());
}

Future<void> initServices() async {
  final JwtAuthenticationManager authenticationManager = Get.find();

  await GetStorage.init();
  await authenticationManager.handleAuthenticationState();
}

class App extends StatelessWidget {
  final JwtAuthenticationManager authenticationManager = Get.find();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: authenticationManager.isAuthenticated()
          ? AppRoutes.homeRouteName
          : AppRoutes.signinRouteName,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
