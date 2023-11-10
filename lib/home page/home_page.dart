import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../authenticaiton feature/controller/auth_controller.dart';
import 'feature_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final authController = Get.find<AuthController>();
  bool darkMode = false;
  final List featureList = [
    'Blood Search',
    'Blood Request',
    'Blood Banks',
    'Hospitals',
    'Doctors',
    'Nurse',
    'Emergency',
    'Ambulance',
    'Helth Info',
    'About',
  ];
  List<String> notifications = [
    'Antor chakraborty need emerjency need 1 bag Ab+ blood',
    'Tasnim hossain need emerjency need 3 bag Ab+ blood2',
    'Notification 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          SizedBox(width: 10.w),
          PopupMenuButton<String>(
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) {
              return notifications.map((String notification) {
                return PopupMenuItem<String>(
                  value: notification,
                  child: Text(notification),
                );
              }).toList();
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
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
                    return Row(
                      children: [
                        const CircleAvatar(
                          radius: 0,
                          backgroundColor: Colors.yellow,
                          child: Icon(Icons.person),
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
              ListTile(
                title: const Text('My Profile'),
                leading: const Icon(Icons.person),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Get.toNamed('/profile');
                },
              ),
              ListTile(
                title: const Text('Donation Histoy'),
                leading: const Icon(Icons.local_hospital),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              ListTile(
                  title: const Text('Dark Theme'),
                  leading: const Icon(Icons.dark_mode),
                  trailing: Switch(
                    value: darkMode,
                    onChanged: (value) {},
                  )),
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
              routeName: routeGenarator(index),
            );
          },
        ),
      ),
    );
  }

  routeGenarator(int index) {
    switch (index) {
      case 0:
        return '/bloodSearch';
      case 1:
        return '/bloodRequest';
      case 2:
        return '/bloodBank';
      case 3:
        return '/hospitals';
      case 4:
        return '/doctors';
      case 5:
        return '/nurse';
      case 6:
        return '/emergency';
      case 7:
        return '/ambulance';
      case 8:
        return '/healthinfo';
      case 9:
        return '/about';
    }
  }
}
