import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberCard extends StatelessWidget {
  final String imageUrl;
  final String phone;
  const NumberCard({required this.imageUrl,required this.phone, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        onTap: () async {
          final url = Uri(scheme: 'tel', path: phone);
          await launchUrl(url);
        },
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: SizedBox(
            height: 180.h,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
