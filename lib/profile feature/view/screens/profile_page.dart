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
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            Center(
                child: Text(controller.userModel.value?.name ?? 'Guest',
                    style: TextStyle(fontSize: 25.sp))),
            Center(
                child: Text(controller.userModel.value?.email ?? 'Guest',
                    style: TextStyle(fontSize: 20.sp))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Donation status: ', style: TextStyle(fontSize: 15.sp)),
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
            Center(
                child: Text('Lase Donation Date: -- -- --',
                    style: TextStyle(fontSize: 16.sp))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      padding: EdgeInsets.symmetric(horizontal: 20.w)),
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Center(
                    child: Text('0',
                        style:
                            TextStyle(fontSize: 50.sp, color: Colors.white))),
              ),
            ),
            Center(
              child: Text(
                'Number of Donation',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Jan',style: TextStyle(color: Colors.white)),
                    Text('Feb',style: TextStyle(color: Colors.white)),
                    Text('Mar',style: TextStyle(color: Colors.white)),
                    Text('Apr',style: TextStyle(color: Colors.white)),
                    Text('May',style: TextStyle(color: Colors.white)),
                    Text('Jun',style: TextStyle(color: Colors.white)),
                    Text('Jul',style: TextStyle(color: Colors.white)),
                    Text('Aug',style: TextStyle(color: Colors.white)),
                    Text('Sep',style: TextStyle(color: Colors.white)),
                    Text('Oct',style: TextStyle(color: Colors.white)),
                    Text('Nov',style: TextStyle(color: Colors.white)),
                    Text('Dec',style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                'Donation History',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Text('--/--/--'),
                        title: Text('-- Bag'),
                        trailing: Text('(+/-)'),
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: Text('--/--/--'),
                        title: Text('-- Bag'),
                        trailing: Text('(+/-)'),
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: Text('--/--/--'),
                        title: Text('-- Bag'),
                        trailing: Text('(+/-)'),
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: Text('--/--/--'),
                        title: Text('-- Bag'),
                        trailing: Text('(+/-)'),
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: Text('--/--/--'),
                        title: Text('-- Bag'),
                        trailing: Text('(+/-)'),
                        textColor: Colors.white,
                      ),
                    ],
                  )),
            ),
            Center(
              child: Text(
                'Blood Request History',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ],
        ));
  }
}
