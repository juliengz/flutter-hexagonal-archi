import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_api_test/app/utils/sizing.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Padding(
          padding: EdgeInsets.all(spacingFactor(2)),
          child: Column(
            children: [
              Obx(
                () => Text(
                  'Welcome ' + (controller.user.value?.name ?? ""),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.error,
                minWidth: double.infinity,
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  controller.signout();
                },
              ),
              // Obx(
              //   () => ListView.builder(
              //     itemCount: controller.users.length,
              //     itemBuilder: (context, index) => Text(
              //       controller.users[index].name,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
