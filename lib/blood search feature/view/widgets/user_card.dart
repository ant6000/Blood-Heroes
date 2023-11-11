import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String location;
  final String number;
  final String bloodGroup;
  const UserCard(
      {required this.name,
      required this.location,
      required this.bloodGroup,
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
            const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 20.sp)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Location: $location',
                      style: TextStyle(fontSize: 15.sp)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red.shade900,
                    child: Text(bloodGroup,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  IconButton(
                      onPressed: () async {
                        Uri url = Uri(scheme: 'tel', path: number);
                        await launchUrl(url);
                      },
                      icon: Icon(
                        Icons.call,
                        color: Colors.blue.shade900,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
