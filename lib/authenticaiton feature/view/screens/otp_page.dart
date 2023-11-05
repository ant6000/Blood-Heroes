import 'package:blood_fighters/authenticaiton%20feature/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});
  final formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

  var otp;
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verify your number',
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
              Text('We have sent you the PIN at 01589442121',
                  style: TextStyle(fontSize: 15.sp)),
              SizedBox(height: 20.h),
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onCodeChanged: (value) {
                  otp = value;
                },
                // onSubmit: (value) {
                //   otp = value;
                //   authController.signInWithCode(otp);
                // },
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text('Dindn\'t receive SMS?',
                      style: TextStyle(fontSize: 15.sp)),
                  Text('Resend Code',
                      style: TextStyle(fontSize: 15.sp, color: Colors.green)),
                ],
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  authController.signInWithCode(otp);
                },
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red.shade900,
                  ),
                  child: Center(
                    child: Text('VERIFY',
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
