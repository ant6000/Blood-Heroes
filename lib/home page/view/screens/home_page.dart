import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../authenticaiton feature/controller/auth_controller.dart';
import '../widgets/feature_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final authController = Get.find<AuthController>();
  bool isDarkMode = false;

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
    'Tasnim hossain need emerjency need 3 bag O+ blood',
    'Notification 3',
    'Notification 4',
    'Notification 5',
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
                          radius: 30,
                          backgroundColor: Colors.yellow,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  authController.userModel.value?.name ??
                                      'Guest',
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                                Text(
                                  authController.userModel.value?.email ??
                                      'guest@email.com',
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Last donation: ',
                                      style: TextStyle(
                                          fontSize: 15.sp, color: Colors.white),
                                    ),
                                    Text(
                                      '--/--/--',
                                      style: TextStyle(
                                          fontSize: 15.sp, color: Colors.white),
                                    ),
                                  ],
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
              Obx(
                () => ListTile(
                    title: const Text('Dark Theme'),
                    leading: const Icon(Icons.dark_mode),
                    trailing: Switch(
                      value: authController.isDarkMode.value,
                      onChanged: (value) {
                        authController.isDarkMode.value = value;
                        Get.changeTheme(authController.isDarkMode.value
                            ? ThemeData.dark()
                            : ThemeData.light());
                      },
                    )),
              ),
              ListTile(
                title: const Text('Data & Privecy Policy'),
                leading: const Icon(Icons.policy),
                onTap: () {
                  Get.defaultDialog(
                      title: 'Data & Privecy Policy',
                      actions: [
                        TextButton(onPressed: () {}, child: Text('cancle')),
                      ],
                      content: Text(
                          'We take reasonable steps to protect your personal information from unauthorized access or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure.\n \n Our app may contain links to third-party websites or services. We are not responsible for the content or privacy practices of those third-party sites.\n\nPlease tailor this privacy policy to fit the specific features and data processing activities of your blood donation app. Consult with legal professionals to ensure compliance with applicable privacy laws and regulations.'));
                },
              ),
              ListTile(
                title: const Text('Share'),
                leading: const Icon(Icons.share),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Rate the app'),
                leading: const Icon(Icons.star_border),
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
