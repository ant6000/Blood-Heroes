import 'package:blood_fighters/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
   RegistrationPage({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool value = false;
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: const Text('Blood Fighters',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/Blood_logo.png',
                width: 200.w,
                height: 200.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.abc),
                    label: const Text('Enter your full name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    label: const Text('Enter your phone'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: locationController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.pin_drop),
                    label: const Text('Enter your location'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: emailController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    label: const Text('Enter your email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: GestureDetector(
                        onTap: () {}, child: const Icon(Icons.remove_red_eye)),
                    label: const Text('Enter your password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.offNamed('/login');
                      }, child: const Text('Already have an account?')),
                  Row(
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: (value) {},
                      ),
                      SizedBox(width: 5.w),
                      const Text('Remember me'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  authController.signInWithEmail(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Obx(
                  () => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: authController.isLoading.isTrue
                      ? const CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)):
                      const Text('Register',
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}