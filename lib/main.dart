import 'package:blood_fighters/ambulance%20feature/view/screens/ambulance_search.dart';
import 'package:blood_fighters/blood%20banks%20feature/view/screens/blood_bank_page.dart';
import 'package:blood_fighters/hospitals%20feature/view/screens/hospitals_lists_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authenticaiton feature/view/screens/login_page.dart';
import 'blood search feature/view/screens/blood_search_page.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'authenticaiton feature/view/screens/otp_page.dart';
import 'authenticaiton feature/view/screens/phone_number_page.dart';
import 'blood request feature/view/screens/blood_request_page.dart';
import 'authenticaiton feature/view/screens/registration_page.dart';
import 'home page/home_page.dart';
import 'profile feature/view/screens/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScreenUtilInit(
    designSize: const Size(360, 800),
    builder: (context, child) => const MyApp(),
  ));
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
            title: 'Blood Fighter',
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            theme: ThemeData(
              primaryColor: Colors.red.shade900,
              useMaterial3: true,
            ),
            initialRoute: '/login',
            getPages: [
              GetPage(name: '/login', page: () => LoginPage()),
              GetPage(name: '/registraiton', page: () => RegistrationPage()),
              GetPage(name: '/phoneNumber', page: () => PhoneNumberPage()),
              GetPage(name: '/otp', page: () => OtpPage()),
              GetPage(name: '/homePage', page: () => HomePage()),
              GetPage(name: '/profile', page: () => ProfilePage()),
              GetPage(name: '/bloodSearch', page: () => BloodSearchPage()),
              GetPage(name: '/bloodRequest', page: () => BloodRequestPage()),
              GetPage(name: '/bloodBank', page: () => BloodBankPage()),
              GetPage(name: '/hospitals', page: () => HospitalSearchPage()),
              GetPage(
                  name: '/doctors', page: () => const AmbulanceSearchPage()),
              GetPage(name: '/nurse', page: () => const AmbulanceSearchPage()),
              GetPage(
                  name: '/emergency', page: () => const AmbulanceSearchPage()),
              GetPage(
                  name: '/ambulance', page: () => const AmbulanceSearchPage()),
              GetPage(
                  name: '/healthinfo', page: () => const AmbulanceSearchPage()),
              GetPage(name: '/about', page: () => const AmbulanceSearchPage()),
            ],
          );
        });
  }
}
