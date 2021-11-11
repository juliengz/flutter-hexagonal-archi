import 'package:flutter_api_test/core/authentication/entities/user.dart';

abstract class PostRepositoryInterface {
  Future<List<User>> allPosts();
}
