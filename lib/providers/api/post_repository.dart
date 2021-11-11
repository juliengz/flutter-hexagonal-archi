import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/blog/entities/post.dart';
import 'package:flutter_api_test/core/blog/interfaces/post_repository_interface.dart';
import 'package:flutter_api_test/providers/api/authentication_repository.dart';
import 'package:flutter_api_test/providers/http_client/http_client.dart';
import 'package:flutter_api_test/providers/http_client/http_request.dart';

class PostRepository implements PostRepositoryInterface {
  @override
  Future<List<User>> allPosts() async {
    // var dio = createHttpClient();
    // var response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    // return (response.data as List).map((data) => Post.fromJson(data)).toList();

    var response = await HttpRequest(requestedUrl: 'users').get(
      onSuccess: (response) {
        return (response.data as List)
            .map((data) => User.fromJson(data))
            .toList();
      },
      onError: (error) {
        if (error.response?.statusCode == 401) {
          throw BadCredentialException(exeptionCauses.badCredential);
        }
      },
    );

    return response;
  }
}
