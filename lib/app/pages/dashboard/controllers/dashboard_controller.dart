import 'package:flutter_api_test/core/blog/entities/post.dart';
import 'package:flutter_api_test/core/blog/use_cases/retrieve_posts_usecase.dart';
import 'package:flutter_api_test/providers/api/post_repository.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final PostRepository postRepository;
  final posts = RxList<Post>([]);

  DashboardController({required this.postRepository});

  @override
  void onInit() async {
    var response = await RetrievePostsUsecase(postRepository).exec();

    posts.value = response;

    super.onInit();
  }
}
