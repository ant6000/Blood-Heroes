import 'package:blood_fighters/authenticaiton_feature/controller/auth_controller.dart';
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
  final bloodGroupController = TextEditingController();
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
          shrinkWrap: true,
          children: [
            Image.asset(
              'images/Blood_logo.png',
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
              controller: locationController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.pin_drop),
                  label: const Text('Enter your location'),
                  hintText: 'Enter Thana, Division',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  label: const Text('Enter your email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  label: const Text('Enter your Phone Number'),
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
                          child: Icon(authController.passwordShow.value
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      label: const Text('Enter your password'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                );
              },
            ),
            SizedBox(height: 10.h),
            DropdownMenu(
              controller: bloodGroupController,
              width: 320.w,
              leadingIcon: const Icon(Icons.water_drop),
              label: const Text('Select your blood group'),
              inputDecorationTheme: const InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelStyle: TextStyle(color: Colors.red)),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 'A+', label: 'A+'),
                DropdownMenuEntry(value: 'A-', label: 'A-'),
                DropdownMenuEntry(value: 'B+', label: 'B+'),
                DropdownMenuEntry(value: 'B-', label: 'B-'),
                DropdownMenuEntry(value: 'O+', label: 'O+'),
                DropdownMenuEntry(value: 'O+', label: 'O-'),
                DropdownMenuEntry(value: 'AB+', label: 'AB+'),
                DropdownMenuEntry(value: 'AB-', label: 'AB-'),
              ],
            ),
            //SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        Get.offNamed('/login');
                      },
                      child: const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.green),
                      )),
                ),
                Expanded(
                  flex: 1, // You can adjust the flex values as needed
                  child: Row(
                    children: [
                      Obx(
                        () {
                          return Checkbox(
                            checkColor: Colors.white,
                            value: authController.isChecked.value,
                            onChanged: (value) {
                              authController.isChecked.value = value ?? false;
                            },
                          );
                        },
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                ),
              ],
            ),
            //SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                authController.registration(
                  emailController.text,
                  passwordController.text,
                  nameController.text,
                  phoneController.text,
                  locationController.text,
                  bloodGroupController.text
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
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue))
                        : const Text('Register',
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
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
