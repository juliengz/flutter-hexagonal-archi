import 'package:flutter_api_test/core/blog/entities/post.dart';

abstract class UserRepositoryInterface {
  Future<Map<String, String>> signin(String login, String password);
}
