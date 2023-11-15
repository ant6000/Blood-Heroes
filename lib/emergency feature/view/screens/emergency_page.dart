import 'package:flutter/material.dart';

import '../widgets/number_card.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});
  static const emergencyList = [
    '16236',
    '999',
    '333',
    '1090'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Emergency',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red.shade900,
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return NumberCard(
              imageUrl: 'images/emergency$index.png',
              phone: emergencyList[index],
            );
          },
        ));
  }
}
