import 'package:flutter_api_test/providers/authentication/jwt_authentication_manager.dart';
import 'package:flutter_api_test/providers/http_client/http_client.dart';
import 'package:flutter_api_test/providers/api/authentication_repository.dart';
import 'package:flutter_api_test/providers/api/post_repository.dart';
import 'package:get/get.dart';

Future injectDependencies() async {
  Get.put(PostRepository(), permanent: true);
  Get.put(AuthenticationRepository(), permanent: true);
  Get.put(createHttpClient(), permanent: true);
  Get.put(
    JwtAuthenticationManager(
        authenticationRepository: AuthenticationRepository()),
    permanent: true,
  );
}
