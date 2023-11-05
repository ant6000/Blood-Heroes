import 'package:flutter/material.dart';

class BloodBankPage extends StatelessWidget {
  const BloodBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BloodBank Search'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}