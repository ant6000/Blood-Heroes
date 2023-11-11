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
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 60.h,
              width: 70.w,
              child: const Icon(
                Icons.location_city_outlined,
                size: 50,
                //color: Colors.white,
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
                  Text('Type: Medical college & hospital',
                      style: TextStyle(fontSize: 15.sp)),
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
