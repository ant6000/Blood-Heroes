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
            GestureDetector(
              onTap: () async {
                final url =
                    Uri(scheme: 'mailto', path: 'info@creativesoftware.com.bd');
                launchUrl(url);
              },
              child: Text(
                'info@creativesoftware.com.bd',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
            Text(
              'Antor Chakraborty',
              style: TextStyle(fontSize: 30.sp, color: Colors.yellow.shade900),
            ),
            GestureDetector(
              onTap: () async {
                final url =
                    Uri(scheme: 'mailto', path: 'antorofficial20@gmail.com');
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
      ),
    );
  }
}
