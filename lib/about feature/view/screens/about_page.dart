import 'package:blood_fighter/const/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              about,
              style: TextStyle(
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 50.h),
            Text(
              'Contact for more',
              style: TextStyle(
                  fontSize: 30.sp, decoration: TextDecoration.underline),
            ),
            Text(
              'Creative Software',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () async {
                    final url = Uri(scheme: 'tel', path: '+880 1717468814');
                    launchUrl(url);
                  },
                  child: Text(
                    '+880 1717-468814',
                    style: TextStyle(fontSize: 25.sp, color: Colors.green),
                  ),
                ),
              ],
            ),
            Text(
              'Antor Chakraborty',
              style: TextStyle(fontSize: 30.sp, color: Colors.yellow.shade900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.mail),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () async{
                    final url = Uri(scheme: 'mailto', path: 'antorofficial20@gmail.com');
                    launchUrl(url);
                  },
                  child: Text(
                    'antorofficial20@gmail.com',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}