import 'package:blood_fighters/authenticaiton%20feature/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneNumberPage extends StatelessWidget {
  PhoneNumberPage({super.key});

  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          'Blood Fighter',
          style: TextStyle(fontSize: 30.sp, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('What is you phone number?',
                    style: TextStyle(
                        fontSize: 30.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^1[3456789]\d{8}$').hasMatch(value)) {
                      return 'Enter a valid phone number';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      label: const Text('Enter your phone number'),
                      prefix: const Text('+880 '),
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      authController.phonNumber.value = phoneController.text;
                      authController
                          .signinWithPhone('+880${phoneController.text}');
                      Get.toNamed('/otp');
                    }
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
                          style:
                              TextStyle(fontSize: 25.sp, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
