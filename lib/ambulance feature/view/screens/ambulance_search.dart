import 'package:flutter/material.dart';

class AmbulanceSearchPage extends StatelessWidget {
  const AmbulanceSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Ambulance Search',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: Center(
        child: Text('Comming Soon',style: TextStyle(fontSize: 40,color: Colors.red.shade900)),
      ),
    );
  }
}