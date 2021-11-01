import 'package:flutter_api_test/core/blog/interfaces/post_reposirtory_interface.dart';
import 'package:flutter_api_test/providers/persistence/post_repository.dart';
import 'package:get/get.dart';

Future injectDependencies() async {
  Get.put(PostRepository(), permanent: true);
}
