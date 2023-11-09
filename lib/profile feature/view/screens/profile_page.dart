import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.red.shade900,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10.h,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.amber,
            ),
             Center(
                child:
                    Text('antor Chakra borty', style: TextStyle(fontSize: 30.sp))),
             Center(
                child: Text('antor@gmail.com', style: TextStyle(fontSize: 25.sp))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Donation status ', style: TextStyle(fontSize: 20.sp)),
                Switch(
                  activeColor: Colors.blue.shade900,
                  value: active,
                  onChanged: (value) {
                    active = true;
                  },
                )
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20.w)
                ),
                onPressed: () {
                
              }, child: Text('Edit Profile',style: TextStyle(color: Colors.white),)),
            )
          ],
        ));
  }
}
