import 'package:blood_fighters/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/save_life_logo_light.png',
              width: 200.w,
              height: 200.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail),
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
                      Get.offNamed('/registraiton');
                    }, child: const Text('Forgor Password?')),
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
                    const Text('Login',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
