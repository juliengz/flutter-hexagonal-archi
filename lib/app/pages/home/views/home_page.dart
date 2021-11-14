import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/pages/home/controllers/home_controller.dart';
import 'package:flutter_api_test/app/utils/sizing.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
            padding: EdgeInsets.all(spacingFactor(2)),
            child: Obx(() => <Widget>[
                  Column(
                    children: [
                      Obx(
                        () => Text(
                          'Welcome ' + (controller.user.value?.name ?? ""),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      SizedBox(height: spacingFactor(2)),
                      Text(
                        'This is a attempt to make a Flutter application using the hexagonal architecture precepts. Happy coding !',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                  ListView(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: const Text('Sign Out'),
                        onTap: () {
                          controller.signout();
                        },
                      ),
                    ],
                  )
                ].elementAt(controller.selectedTabIndex))),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: Colors.pink,
                ),
              ],
              currentIndex: controller.selectedTabIndex,
              selectedItemColor: Colors.pink,
              onTap: controller.onItemTapped),
        ),
      ),
    );
  }
}
