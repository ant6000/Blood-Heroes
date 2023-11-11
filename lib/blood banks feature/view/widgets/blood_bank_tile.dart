import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodBankTile extends StatelessWidget {
  final String name;
  final String location;
  final String number;
  const BloodBankTile(
      {required this.name,
      required this.location,
      required this.number,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 60.h,
              width: 70.w,
              child:  Icon(
                Icons.add_home_work_sharp,
                size: 50,
                color: Colors.red.shade900,
              ),
            ),
            SizedBox(
              width: 220,
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
