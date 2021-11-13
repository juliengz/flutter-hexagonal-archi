import 'package:flutter_api_test/providers/authentication/jwt_authentication_manager.dart';
import 'package:flutter_api_test/providers/http_client/http_client.dart';
import 'package:flutter_api_test/providers/api/authentication_repository.dart';
import 'package:flutter_api_test/providers/api/user_repository.dart';
import 'package:flutter_api_test/providers/state/user_state.dart';
import 'package:get/get.dart';

Future injectDependencies() async {
  Get.put(UserRepository(), permanent: true);
  Get.put(UserState(), permanent: true);
  Get.put(AuthenticationRepository(), permanent: true);
  Get.put(createHttpClient(), permanent: true);
  Get.put(
    JwtAuthenticationManager(
      authenticationRepository: AuthenticationRepository(),
    ),
    permanent: true,
  );
}
