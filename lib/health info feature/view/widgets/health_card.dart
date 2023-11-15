import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthCard extends StatelessWidget {
  final String title;
  final String body;
  const HealthCard({required this.title, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            SizedBox(height: 8),
            Text(
              body,style: TextStyle(fontSize: 15.sp),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
