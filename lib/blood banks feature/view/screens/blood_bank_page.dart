import 'package:flutter/material.dart';
import '../widgets/blood_bank_tile.dart';

class BloodBankPage extends StatelessWidget {
  const BloodBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.red.shade900,
            centerTitle: true,
            title: const Text(
              'Blood Banks',
              style: TextStyle(color: Colors.white),
            ),
            floating: true,
            pinned: true,
            snap: true,
            bottom: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.red.shade900,
              title: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.only(top: 5),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.yellow.shade900),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.local_hospital),
                        hintText: 'Enter Location'),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
            return const BloodBankTile(
              name: 'Red Life',
              location: 'Sahmoli 12, Dhaka',
              number: '12356478',

            );
          }))
        ],
      ),
    );
  }
}