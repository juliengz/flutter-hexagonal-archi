import 'package:flutter_api_test/core/blog/entities/post.dart';
import 'package:flutter_api_test/core/blog/interfaces/post_repository_interface.dart';
import 'package:flutter_api_test/providers/http_client/http_client.dart';

class PostRepository implements PostRepositoryInterface {
  @override
  Future<List<Post>> allPosts() async {
    var dio = createHttpClient();
    var response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    return (response.data as List).map((data) => Post.fromJson(data)).toList();
  }
}
