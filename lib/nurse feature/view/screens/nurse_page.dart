import 'package:flutter/material.dart';

class NursePage extends StatelessWidget {
  const NursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Nurses',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: Center(
        child: Text('Comming Soon',style: TextStyle(fontSize: 40,color: Colors.red.shade900)),
      ),
    );
  }
}