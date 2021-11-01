import 'package:flutter_api_test/core/blog/entities/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter_api_test/core/blog/interfaces/post_reposirtory_interface.dart';

class PostRepository implements PostRepositoryInterface {
  @override
  Future<List<Post>> allPosts() async {
    var dio = Dio();
    var response = await dio.get('https://jsonplaceholder.typicode.com/posts');

    return (response.data as List).map((data) => Post.fromJson(data)).toList();
  }
}
