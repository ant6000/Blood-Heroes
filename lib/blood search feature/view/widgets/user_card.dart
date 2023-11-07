import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.amber),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.red,
              child: Icon(Icons.person),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Antor Chakraborty', style: TextStyle(fontSize: 20.sp)),
                SizedBox(
                  height: 15,
                ),
                Text('Location: Dhaka Framgate',
                    style: TextStyle(fontSize: 15.sp)),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.red.shade900,
                  child: Text('AB+',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                      child: Icon(
                        Icons.phone,
                        size: 30,
                        color: Colors.green.shade900,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
