import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorsTile extends StatelessWidget {
  final String name;
  final String title;
  final String address;
  final String phone;
  final String imageUrl;
  final String dept;
  const DoctorsTile(
      {required this.name,
      required this.title,
      required this.address,
      required this.phone,
      required this.dept,
      required this.imageUrl,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('images/icon4.png'),
            ),
            SizedBox(width: 5.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Row(
                    children: [
                      Text('Specialist:',style: TextStyle(fontSize: 16),),
                      Text(
                        dept,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  Text(
                    address,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () async {
                  Uri pnumber = Uri(scheme: 'tel', path: phone);
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
