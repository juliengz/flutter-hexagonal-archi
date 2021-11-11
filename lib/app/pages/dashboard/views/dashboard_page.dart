import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
          ),
          body: Obx(
            () => ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) => Text(
                controller.users[index].name,
              ),
            ),
          ),
        ),
      );
    });
  }
}
