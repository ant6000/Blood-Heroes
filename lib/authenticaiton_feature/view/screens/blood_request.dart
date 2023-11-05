import 'package:flutter/material.dart';

class BloodRequestPage extends StatelessWidget {
  const BloodRequestPage({super.key});
  static const String routeName = '/bloodRequest';
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood request'),
      ),
      body: Form(
        child: ListView(
          children: [

          ],
        )),
    );
  }
}