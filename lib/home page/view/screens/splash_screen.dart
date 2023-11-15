import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
