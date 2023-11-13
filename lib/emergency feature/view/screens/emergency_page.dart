import 'package:flutter/material.dart';

import '../widgets/number_card.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

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
          itemCount: 8,
          itemBuilder: (context, index) {
            return NumberCard(imageUrl: 'images/num$index.png',);
          },
        ));
  }
}
