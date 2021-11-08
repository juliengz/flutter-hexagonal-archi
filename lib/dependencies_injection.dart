import 'package:flutter_api_test/core/authentication/use_cases/signin_usecase.dart';
import 'package:flutter_api_test/providers/authentication/jwt_authentication_manager.dart';
import 'package:flutter_api_test/providers/http_client/http_client.dart';
import 'package:flutter_api_test/providers/api/user_repository.dart';
import 'package:flutter_api_test/providers/api/post_repository.dart';
import 'package:get/get.dart';

Future injectDependencies() async {
  Get.put(PostRepository(), permanent: true);
  Get.put(UserRepository(), permanent: true);
  Get.put(createHttpClient(), permanent: true);
  Get.put(
    JwtAuthenticationManager(userRepository: UserRepository()),
    permanent: true,
  );
}
