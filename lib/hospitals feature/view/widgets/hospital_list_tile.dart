import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalListTile extends StatelessWidget {
  final String name;
  final String location;
  final String number;
  final String type;
  final String imageUrl;
  const HospitalListTile(
      {required this.name,
      required this.location,
      required this.type,
      required this.number,
      required this.imageUrl,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 5.h),
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
        //padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 70.h,
              width: 70.w,
              child: Image.asset(
                'images/icon3.png',
              ),
            ),
            SizedBox(
              width: 220.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 20.sp)),
                  Text('Location: $location',
                      style: TextStyle(fontSize: 15.sp)),
                  // Text('Type: Medical college & hospital',
                  //     style: TextStyle(fontSize: 15.sp)),
                ],
              ),
            ),
            InkWell(
                onTap: () async {
                  Uri url = Uri(scheme: 'tel', path: number);
                  await launchUrl(url);
                },
                child: Icon(
                  Icons.call,
                  size: 30,
                  color: Colors.blue.shade900,
                ))
          ],
        ),
      ),
    );
  }
}
