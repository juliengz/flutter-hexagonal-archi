import 'package:flutter_api_test/core/blog/entities/post.dart';
import 'package:flutter_api_test/core/blog/interfaces/post_reposirtory_interface.dart';
import 'package:flutter_api_test/tooling/logger.dart';

class RetrievePostsUsecase {
  final PostRepositoryInterface postRepository;

  RetrievePostsUsecase(this.postRepository);

  Future<List<Post>> exec() {
    log('exec RetrievePostsUsecase');
    return postRepository.allPosts();
  }
}
