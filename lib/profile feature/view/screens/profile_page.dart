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
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20.w)),
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                color: Colors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('0', style: TextStyle(fontSize: 50.sp)),
                    Text('Number of donation', style: TextStyle(fontSize: 20.sp)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
             Center(
                child: Text(
              'Accepted Donor',
              style: TextStyle(fontSize: 20.sp),
            )),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    tileColor: Colors.amber,
                    textColor: Colors.black,
                    title: Text('Antor, chakraborty'),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
