import 'package:flutter/material.dart';

class BloodSearchPage extends StatelessWidget {
  const BloodSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Search'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}