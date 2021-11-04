import 'package:flutter_api_test/providers/http_client/http_client.dart';
import 'package:flutter_api_test/providers/persistence/post_repository.dart';
import 'package:get/get.dart';

Future injectDependencies() async {
  Get.put(PostRepository(), permanent: true);
  Get.put(createHttpClient(), permanent: true);
}
