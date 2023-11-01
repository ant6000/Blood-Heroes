import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'firebase_options.dart';
import 'view/screens/home_page.dart';
import 'view/screens/login_page.dart';
import 'view/screens/registration_page.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (_,child) {
        return GetMaterialApp(
          title: 'Blood Fighters',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            useMaterial3: true,
          ),
          initialRoute: '/registraiton',
          getPages: [
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/registraiton', page: () => RegistrationPage()),
            GetPage(name: '/homePage', page: () => const HomePage()),
          ],
        );
      }
    );
  }
}

