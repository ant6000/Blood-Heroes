import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'authenticaiton_feature/controller/auth_controller.dart';
import 'authenticaiton_feature/view/widgets/feature_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final authController = Get.find<AuthController>();
  final List featureList = [
    'Blood Search',
    'Blood Request',
    'Blood Banks',
    'Ambulance',
    'Hospitals',
    'Doctors',
    'Nurse',
    'Emergency',
    'Blog',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: const Text(
            'DashBoard',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            SizedBox(width: 10.w),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(color: Colors.red.shade900),
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.yellow,
                              child: Icon(Icons.person),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                authController.userModel.value?.email ?? 'Xxxx',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                authController.userModel.value?.name ??
                                    'xxxx@gmail.com',
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      );
                    })),
                ListTile(
                  title: const Text('My Profile'),
                  leading: const Icon(Icons.person),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Donation Histoy'),
                  leading: const Icon(Icons.local_hospital),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Settings'),
                  leading: const Icon(Icons.settings),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red.shade900),
                  ),
                  leading: const Icon(Icons.logout),
                  onTap: () {
                    authController.logOut();
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FeatureCard(
                iconData: 'icon$index.png',
                index: index,
                text: featureList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
