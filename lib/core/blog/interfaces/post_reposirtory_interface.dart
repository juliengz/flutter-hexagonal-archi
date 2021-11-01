import 'package:flutter_api_test/core/blog/entities/post.dart';

abstract class PostRepositoryInterface {
  Future<List<Post>> allPosts();
}
