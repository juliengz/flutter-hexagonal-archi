import 'package:flutter_api_test/core/authentication/entities/user.dart';
import 'package:get/get.dart';

class UserState {
  final Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;
  set user(u) => _user.value = u;

  reset() {
    user = null;
  }
}
