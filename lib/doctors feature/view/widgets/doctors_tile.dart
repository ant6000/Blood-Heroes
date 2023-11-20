import 'package:flutter/material.dart';

class DoctorsTile extends StatelessWidget {
  final String name;
  final String title;
  final String address;
  final String phone;
  final String imageUrl;
  final String dept;
  const DoctorsTile(
      {required this.name,
      required this.title,
      required this.address,
      required this.phone,
      required this.dept,
      required this.imageUrl,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.amber,
          ),
          Column(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                dept,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                address,
                style: TextStyle(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
