import 'package:blood_fighter/authenticaiton%20feature/controller/auth_controller.dart';
import 'package:blood_fighter/authenticaiton%20feature/view/screens/login_page.dart';
import 'package:blood_fighter/const/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final authcontrolle = Get.find<AuthController>();
    checkValidation(authcontrolle);
    super.initState();
  }

Future checkValidation(AuthController authController) async {
  final email = await SharedPref.getEmail();
  if (email != null) {
    // If email is stored, navigate to HomePage
    authController.showUserInfo(email);
    Get.offNamed('/homePage');
  } else {
    // If email is not stored, navigate to LoginPage
    Timer(const Duration(seconds: 2), () => Get.to(LoginPage()));
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Blood Fighter',
                style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold)),
            Image.asset(
              'images/save_life_logo_light.png',
              height: 200.h,
              width: 200.w,
            ),
            Text(
              'Find & Donate Blood',
              style: TextStyle(color: Colors.red.shade900, fontSize: 30.sp),
            )
          ],
        ),
      ),
    );
  }
}
