import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          'Blood Fighter',
          style: TextStyle(fontSize: 30.sp,color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What is you phone number?',
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 20.h),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    label: const Text('Enter your phone number'),
                    prefix: const Text('+880 '),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                 Get.offNamed('/otp');
                },
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red.shade900,
                  ),
                  child: Center(
                    child: Text('Continue',
                        style: TextStyle(fontSize: 25.sp, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
