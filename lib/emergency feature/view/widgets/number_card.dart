import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberCard extends StatelessWidget {
  final String imageUrl;
  const NumberCard({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
    );
  }
}
