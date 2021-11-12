import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/blog/interfaces/user_repository_interface.dart';

class RetrieveUsersUsecase {
  final UserRepositoryInterface userRepository;

  RetrieveUsersUsecase(this.userRepository);

  Future<List<User>> exec() async {
    return await userRepository.allUsers();
  }
}
