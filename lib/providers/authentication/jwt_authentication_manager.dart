import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/interfaces/authentication_manager.dart';
import 'package:flutter_api_test/core/authentication/interfaces/user_repository_interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtAuthenticationManager implements AuthenticationManagerInterface {
  final UserRepositoryInterface userRepository;
  final storage = const FlutterSecureStorage();

  JwtAuthenticationManager({required this.userRepository});

  @override
  Future<User> signin(String login, String password) async {
    Map<String, String> tokens = await userRepository.signin(login, password);

    await storage.write(key: 'accessToken', value: tokens['accessToken']);
    await storage.write(key: 'refreshToken', value: tokens['refreshToken']);

    return User(id: 1, name: 'fake');
  }

  @override
  void signout() {}

  @override
  bool isAuthenticated() {
    return false;
  }
}
