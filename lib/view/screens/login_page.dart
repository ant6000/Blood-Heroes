import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool value = false;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/save_life_logo_light.png',width: 200,height: 200,),
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
                TextButton(onPressed: () {}, child: const Text('Forgor Password')),
                Row(
                  children: [
                    Checkbox(value: value, onChanged: (value) {
                    },),
                    SizedBox(width: 5.w),
                    const Text('Remember me'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text('Login',
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
