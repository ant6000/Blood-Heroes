import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberCard extends StatelessWidget {
  final String imageUrl;
  const NumberCard({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        onTap: () async {
          final url = Uri(scheme: 'tel', path: '999');
          await launchUrl(url);
        },
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: SizedBox(
            height: 150.h,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
