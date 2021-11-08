abstract class UserRepositoryInterface {
  Future<Map<String, String>> signin(String login, String password);
}
