import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: Text('Comming Soon',style: TextStyle(fontSize: 20.sp,color: Colors.red.shade900)),
      ),
    );
  }
}