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
      padding: EdgeInsets.only(top: 10.w, bottom: 5.h,left: 10.h, right: 10.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade600,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                  spreadRadius: 5)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 50.h,
              width: 50.w,
              child: Image.asset('images/icon5.png'),
            ),
            SizedBox(
              width: 220.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 20.sp)),
                  Text('Location: $location',
                      style: TextStyle(fontSize: 15.sp)),
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
