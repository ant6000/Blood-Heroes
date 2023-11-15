import 'package:blood_fighter/const/strings.dart';
import 'package:blood_fighter/health%20info%20feature/view/widgets/health_card.dart';
import 'package:flutter/material.dart';

class HealthInfoPage extends StatelessWidget {
  const HealthInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Health Info',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: ListView(
        children: [
          HealthCard(title: 'রক্তদানের উপকারিতা',body: bloodDonationBenefits),
          HealthCard(title: 'কে রক্ত দিতে পারে',body: criteria),
          HealthCard(title: 'রক্তদান সম্পর্কে ভুল ধারণা ও তথ্য',body: mythfacts),

        ],
      )
    );
  }
}