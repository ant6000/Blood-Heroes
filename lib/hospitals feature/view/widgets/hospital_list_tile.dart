import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 60.h,
              width: 70.w,
              //color: Colors.black,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
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
            IconButton(
                onPressed: () {},
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
