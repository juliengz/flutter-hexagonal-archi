import 'package:flutter_api_test/core/authentication/entities/user.dart';

abstract class UserRepositoryInterface {
  Future<List<User>> allUsers();
}
