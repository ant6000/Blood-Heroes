import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureCard extends StatelessWidget {
  final int index;
  final String text;
  final String iconData;
  const FeatureCard(
      {required this.index,
      required this.text,
      required this.iconData,
      super.key});

  @override
  Widget build(BuildContext context) {
    print('images/icons/$iconData');
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/$iconData',width: 80.w,height: 80.h,
          ),
          SizedBox(height: 5.w),
          Text(
            text,
            style:  TextStyle(fontSize: 18.sp),
          )
        ],
      ),
    );
  }
}
