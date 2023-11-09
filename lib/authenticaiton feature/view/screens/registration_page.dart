import 'package:blood_fighters/authenticaiton%20feature/controller/auth_controller.dart';
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
  String? selectedBloodGroup;

  final authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

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
          key: formKey,
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
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.abc),
                    label: const Text('Enter your full name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Enter correct name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: locationController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.pin_drop),
                    label: const Text('Enter your location'),
                    hintText: 'Enter Thana, Division',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-zA-Z0-9, -]+$').hasMatch(value)) {
                    return 'Enter a valid location';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10.h),
              TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
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
                  }),
              SizedBox(height: 10.h),
              TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefix: const Text('+880 '),
                      prefixIcon: const Icon(Icons.phone),
                      label: const Text('Enter your Phone Number'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^1[3456789]\d{8}$').hasMatch(value)) {
                      return 'Enter a valid Bangladeshi phone number';
                    } else {
                      return null;
                    }
                  }),
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
                              child: Icon(authController.passwordShow.value
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          label: const Text('Enter your password'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{8,}$')
                                .hasMatch(value)) {
                          return 'Password must meet the requirements(number,symbol,capital letter)';
                        } else {
                          return null;
                        }
                      });
                },
              ),
              SizedBox(height: 10.h),
              DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.water_drop),
                    label: const Text('Select your blood group'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                value: selectedBloodGroup,
                onChanged: (value) {
                  selectedBloodGroup = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a blood group';
                  }
                  return null;
                },
                items: const [
                  DropdownMenuItem<String>(value: 'A+', child: Text('A+')),
                  DropdownMenuItem<String>(value: 'A-', child: Text('A-')),
                  DropdownMenuItem<String>(value: 'B+', child: Text('B+')),
                  DropdownMenuItem<String>(value: 'B-', child: Text('B-')),
                  DropdownMenuItem<String>(value: 'O+', child: Text('O+')),
                  DropdownMenuItem<String>(value: 'O-', child: Text('O-')),
                  DropdownMenuItem<String>(value: 'AB+', child: Text('AB+')),
                  DropdownMenuItem<String>(value: 'AB-', child: Text('AB-')),
                  DropdownMenuItem<String>(
                      value: 'Not Sure', child: Text('Not Sure')),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
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
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    authController.registration(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                        '8801${phoneController.text}',
                        locationController.text,
                        selectedBloodGroup!);
                  }
                },
                child: Obx(
                  () => Container(
                    width: double.infinity,
                    height: 60.h,
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
                                  TextStyle(fontSize: 25, color: Colors.white)),
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
