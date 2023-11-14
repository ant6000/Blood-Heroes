import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostTile extends StatelessWidget {
  final String location;
  final String bloodGroup;
  final int quantity;
  final String name;
  final String phone;
  final String condition;
  final String date;
  const PostTile(
      {required this.name,
      required this.location,
      required this.bloodGroup,
      required this.phone,
      required this.quantity,
      required this.condition,
      required this.date,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: $name',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Location: $location'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('Blood Group: $bloodGroup'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('Quantity: $quantity units'),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Condition: $condition'),
                const SizedBox(height: 8),
                Text('Date: $date'),
                const SizedBox(height: 8),
                Text('Phone: $phone'),
              ],
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  child: Text('AB+',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 20.h),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    child: const Text('Donate',style: TextStyle(color: Colors.white),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
