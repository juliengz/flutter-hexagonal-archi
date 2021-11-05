import 'package:flutter_api_test/core/user/interfaces/user_repository_interface.dart';

class SigninUseCase {
  final UserRepositoryInterface userRepository;

  SigninUseCase(this.userRepository);

  Future<Map<String, String>> exec(String login, String password) async {
    return await userRepository.signin(login, password);
  }
}
