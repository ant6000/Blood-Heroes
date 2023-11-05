import 'package:flutter/material.dart';

class AmbulanceSearchPage extends StatelessWidget {
  const AmbulanceSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance Search'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}