import 'package:blood_fighters/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'authenticaiton_feature/view/screens/otp_page.dart';
import 'authenticaiton_feature/view/screens/phone_number_page.dart';
import 'firebase_options.dart';
import 'authenticaiton_feature/view/screens/login_page.dart';
import 'authenticaiton_feature/view/screens/registration_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Blood Fighters',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
              useMaterial3: true,
            ),
            initialRoute: '/homePage',
            getPages: [
              GetPage(name: '/login', page: () => LoginPage()),
              GetPage(name: '/registraiton', page: () => RegistrationPage()),
              GetPage(name: '/phoneNumber', page: () => const PhoneNumberPage()),
              GetPage(name: '/otp', page: () => const OtpPage()),
              GetPage(name: '/homePage', page: () =>  HomePage()),
            ],
          );
        });
  }
}
