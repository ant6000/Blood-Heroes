import 'package:blood_fighter/const/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../authenticaiton feature/controller/auth_controller.dart';
import '../widgets/feature_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final authController = Get.find<AuthController>();
  bool isDarkMode = false;
  final _rateMyApp = RateMyApp(
    remindDays: 2,
    remindLaunches: 2,
    minLaunches: 5,
    minDays: 2,
    googlePlayIdentifier: '',
    preferencesPrefix: '_rateMyApp',
  );

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
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
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
                title: const Text('Data Privecy & Policy'),
                leading: const Icon(Icons.policy),
                onTap: () {
                  Get.defaultDialog(
                      title: 'Data & Privecy Policy',
                      actions: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Cancle')),
                      ],
                      content: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data_privecy,
                              textAlign: TextAlign.justify,
                            ),
                            GestureDetector(
                                onTap: () async {
                                  Uri url = Uri.parse(
                                      'https://sites.google.com/view/bloodfighter-org/home');
                                  await launchUrl(url);
                                },
                                child: const Text(
                                  'To Read More click here',
                                  style: TextStyle(
                                      color: Colors.green,
                                      decoration: TextDecoration.underline),
                                )),
                          ],
                        ),
                      ));
                },
              ),
              ListTile(
                title: const Text('Share'),
                leading: const Icon(Icons.share),
                onTap: () async {
                  await Share.shareWithResult(
                      'https://play.google.com/store/apps/details?id=com.antor.blood_heroes');
                },
              ),
              ListTile(
                title: const Text('Rate the app'),
                leading: const Icon(Icons.star_border),
                onTap: () {
                  _rateMyApp.init().then((_) {
                    _rateMyApp.showStarRateDialog(context,
                        title: 'Please Rate this app',
                        message: 'This will help us to make better app',
                        actionsBuilder: (context, stars) {
                          return [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  child: const Text('Submit',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    final String playStoreUrl =
                                        'https://play.google.com/store/apps/details?id=com.antor.blood_heroes';
                                    final url = Uri.parse(playStoreUrl);
                                    launchUrl(url);
                                  },
                                ),
                                const SizedBox(width: 10),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.red.shade800),
                                  child: const Text(
                                    'Cancle',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            )
                          ];
                        },
                        dialogStyle: const DialogStyle(
                            titleAlign: TextAlign.center,
                            messageAlign: TextAlign.center,
                            messagePadding: EdgeInsets.only(bottom: 10)),
                        starRatingOptions: const StarRatingOptions(),
                        onDismissed: () => _rateMyApp
                            .callEvent(RateMyAppEventType.laterButtonPressed));
                  });
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.red.shade900),
                ),
                leading: const Icon(Icons.logout),
                onTap: () async {
                  await authController.logOut();
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
        return '/healthInfo';
      case 9:
        return '/about';
    }
  }
}
