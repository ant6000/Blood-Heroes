import 'package:blood_fighters/authenticaiton_feature/controller/auth_controller.dart';
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
        title: const Text('Blood Fighter',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(top: 50.h),
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
            Obx(
              () {
                return TextField(
                  controller: passwordController,
                  obscureText: authController.passwordShow.value,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            authController.passwordShow.toggle();
                          },
                          child: authController.passwordShow.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      label: const Text('Enter your password'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                );
              },
            ),
            //SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () {
                        return Checkbox(
                          checkColor: Colors.white,
                          value: authController.isChecked.value,
                          onChanged: (value) {
                            authController.isChecked.value = value!;
                          },
                        );
                      },
                    ),
                    const Text('Remember me'),
                  ],
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgor Password?')),
              ],
            ),
            //SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                authController.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Obx(
                () => Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: authController.isLoading.isTrue
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue))
                        : Text('Login',
                            style: TextStyle(
                                fontSize: 25, color: Colors.white)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                Get.offNamed('/phoneNumber');
              },
              child: Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red.shade900),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.red.shade900,
                    ),
                    SizedBox(width: 80.w,),
                    Text('Login with Phone',
                        style: TextStyle(
                            fontSize: 25, color: Colors.red.shade900)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.offNamed('/registraiton');
                },
                child: Text('Register new account >',
                    style: TextStyle(fontSize: 18, color: Colors.green)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
