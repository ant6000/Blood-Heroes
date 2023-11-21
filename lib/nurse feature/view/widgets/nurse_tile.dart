import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class NurseTile extends StatelessWidget {
  final String name;
  final String location;
  final String number;
  const NurseTile(
      {required this.name,
      required this.location,
      required this.number,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 50, width: 50, child: Image.asset('images/icon5.png')),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  Text(
                    location,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () async {
                  Uri pnumber = Uri(scheme: 'tel', path: number);
                  await launchUrl(pnumber);
                },
                icon: Icon(
                  Icons.call,
                  color: Colors.blue.shade900,
                ))
          ],
        ),
      ),
    );
  }
}
