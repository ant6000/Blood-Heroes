import 'package:blood_fighter/ambulance%20feature/view/screens/ambulance_search.dart';
import 'package:blood_fighter/blood%20banks%20feature/view/screens/blood_bank_page.dart';
import 'package:blood_fighter/hospitals%20feature/view/screens/hospitals_lists_page.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'about feature/view/screens/about_page.dart';
import 'authenticaiton feature/view/screens/login_page.dart';
import 'blood search feature/view/screens/blood_search_page.dart';
import 'doctors feature/view/screens/doctors_page.dart';
import 'emergency feature/view/screens/emergency_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'blood request feature/view/screens/blood_request_page.dart';
import 'authenticaiton feature/view/screens/registration_page.dart';
import 'health info feature/view/screens/health_info_page.dart';
import 'home page/view/screens/home_page.dart';
import 'nurse feature/view/screens/nurse_page.dart';
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
            themeMode: ThemeMode.light,
            theme: ThemeData(
              primaryColor: Colors.red.shade900,
              useMaterial3: true,
            ),
            initialRoute: '/login',
            getPages: [
              GetPage(name: '/login', page: () => LoginPage()),
              GetPage(name: '/registraiton', page: () => RegistrationPage()),
              GetPage(name: '/homePage', page: () => HomePage()),
              GetPage(name: '/profile', page: () => ProfilePage()),
              GetPage(name: '/bloodSearch', page: () => const BloodSearchPage()),
              GetPage(name: '/bloodRequest', page: () => BloodRequestPage()),
              GetPage(name: '/bloodBank', page: () => BloodBankPage()),
              GetPage(name: '/hospitals', page: () => HospitalSearchPage()),
              GetPage(name: '/doctors', page: () => const DoctorsPage()),
              GetPage(name: '/nurse', page: () => const NursePage()),
              GetPage(name: '/emergency', page: () => const EmergencyPage()),
              GetPage(name: '/ambulance', page: () => const AmbulanceSearchPage()),
              GetPage(name: '/healthInfo', page: () => const HealthInfoPage()),
              GetPage(name: '/about', page: () => const AboutPage()),
            ],
          );
        });
  }
}
