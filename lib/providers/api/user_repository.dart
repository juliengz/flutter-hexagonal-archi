import 'package:flutter_api_test/core/user/interfaces/user_repository_interface.dart';
import 'package:flutter_api_test/providers/http_client/http_client.dart';

class UserRepository implements UserRepositoryInterface {
  @override
  Future<Map<String, String>> signin(String login, String password) async {
    var dio = createHttpClient();
    var response = await dio.post('http://10.0.2.2:8080/auth',
        data: {'login': login, 'password': password});
    return {
      "accessToken": response.data.accessToken,
      "refreshToken": response.data.refreshToken,
    };
  }
}
