import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: '0',
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: '0',
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: '0',
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: '0',
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text('Dindn\'t receive SMS?',
                      style: TextStyle(fontSize: 15.sp)),
                  Text('Resend Code',
                      style: TextStyle(fontSize: 15.sp, color: Colors.green)),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
