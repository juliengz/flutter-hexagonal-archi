import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:flutter_api_test/core/authentication/exceptions/bad_credential_exception.dart';
import 'package:flutter_api_test/core/blog/interfaces/user_repository_interface.dart';
import 'package:flutter_api_test/providers/http_client/http_request.dart';

class UserRepository implements UserRepositoryInterface {
  @override
  Future<List<User>> allUsers() async {
    var response = await HttpRequest(requestedUrl: 'users').get(
      onSuccess: (response) {
        return (response.data as List)
            .map((data) => User.fromJson(data))
            .toList();
      },
      onError: (error) {
        if (error.response?.statusCode == 401) {
          throw BadCredentialException();
        }
      },
    );

    return response;
  }
}
