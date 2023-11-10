import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../authenticaiton feature/controller/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.find<AuthController>();

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
                child: Text(controller.userModel.value?.name ?? 'Guest',
                    style: TextStyle(fontSize: 30.sp))),
            Center(
                child: Text(controller.userModel.value?.email ?? 'Guest',
                    style: TextStyle(fontSize: 25.sp))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Donation status ', style: TextStyle(fontSize: 20.sp)),
                Obx(
                  () => Switch(
                    activeColor: Colors.blue.shade900,
                    value: controller.userModel.value!.donationStatus,
                    onChanged: (value) {
                      controller.toggleDonationStatus(
                          controller.userModel.value!.name, value);
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20.w)),
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ));
  }
}
