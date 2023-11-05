import 'package:blood_fighters/authenticaiton_feature/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.userModel.value?.name ?? 'xx',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          controller.userModel.value?.email ?? 'xx@example.com',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    ));
  }
}
