import 'package:flutter_api_test/app/routes/app_routes.dart';
import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/use_cases/signout_usecase.dart';
import 'package:flutter_api_test/core/blog/use_cases/retrieve_users_usecase.dart';
import 'package:flutter_api_test/providers/api/user_repository.dart';
import 'package:flutter_api_test/providers/authentication/jwt_authentication_manager.dart';
import 'package:flutter_api_test/providers/state/user_state.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final UserRepository userRepository;
  final UserState userState;
  final JwtAuthenticationManager authenticationManager;

  final users = RxList<User>([]);
  Rx<User?> user = Rx<User?>(null);

  DashboardController({
    required this.userRepository,
    required this.userState,
    required this.authenticationManager,
  });

  @override
  void onInit() async {
    var response = await RetrieveUsersUsecase(userRepository).exec();

    users.value = response;
    user.value = userState.user;

    super.onInit();
  }

  void signout() async {
    await SignoutUseCase(authenticationManager).exec();
    Get.offNamed(AppRoutes.signinRouteName);
  }
}
