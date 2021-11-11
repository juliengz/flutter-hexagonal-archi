import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/blog/use_cases/retrieve_users_usecase.dart';
import 'package:flutter_api_test/providers/api/user_repository.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final UserRepository userRepository;
  final users = RxList<User>([]);

  DashboardController({required this.userRepository});

  @override
  void onInit() async {
    var response = await RetrieveUsersUsecase(userRepository).exec();

    users.value = response;

    super.onInit();
  }
}
