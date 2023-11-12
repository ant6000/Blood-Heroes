import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeatureCard extends StatelessWidget {
  final int index;
  final String text;
  final String iconData;
  final String routeName;
  const FeatureCard(
      {required this.index,
      required this.text,
      required this.iconData,
      required this.routeName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(routeName);
      },
      child: Card(
        elevation: 1,
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/$iconData',
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(height: 5.w),
            Text(
              text,
              style: TextStyle(fontSize: 20.sp,
              color: Theme.of(context).textTheme.bodyLarge?.color,),
            )
          ],
        ),
      ),
    );
  }
}
