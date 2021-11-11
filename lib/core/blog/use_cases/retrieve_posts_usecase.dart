import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/blog/interfaces/post_repository_interface.dart';

class RetrievePostsUsecase {
  final PostRepositoryInterface postRepository;

  RetrievePostsUsecase(this.postRepository);

  Future<List<User>> exec() async {
    return await postRepository.allPosts();
  }
}
