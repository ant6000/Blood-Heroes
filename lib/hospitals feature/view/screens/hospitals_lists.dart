import 'package:flutter/material.dart';

class HospitalSearchPage extends StatelessWidget {
  const HospitalSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Search'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}