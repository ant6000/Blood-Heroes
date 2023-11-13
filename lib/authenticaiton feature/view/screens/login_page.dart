import 'package:blood_fighter/authenticaiton%20feature/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool value = false;
  final formKey = GlobalKey<FormState>();
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
        child: Form(
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
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    label: const Text('Enter your email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                    return 'Enter a valid email address';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10.h),
              Obx(
                () {
                  return TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{8,}$')
                              .hasMatch(value)) {
                        return 'Password must meet the requirements';
                      } else {
                        return null;
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () {
                          return Checkbox(
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
              SizedBox(height: 10.h),
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
                          : const Text('Login',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  Get.offNamed('/registraiton');
                },
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.red.shade900),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create new account',
                          style: TextStyle(
                              fontSize: 25, color: Colors.red.shade900)),
                    ],
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
