import 'package:flutter_api_test/providers/api/user_repository.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final UserRepository userRepository;

  SigninController({required this.userRepository});

  @override
  void onInit() async {
    print('Signin');
    super.onInit();
  }
}
