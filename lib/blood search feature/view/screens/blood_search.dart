import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodSearchPage extends StatelessWidget {
  BloodSearchPage({super.key});
  String? bloodGroup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(double.infinity, 200.h), child: Container(
        color: Colors.red.shade900,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_pin),
                  label: const Text('Enter Location specific area'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: 10.h),
            DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(20),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.water_drop),
                  label: const Text('Select Patient Blood Group'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              value: bloodGroup,
              onChanged: (value) {
                bloodGroup = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a blood group';
                }
                return null;
              },
              items: const [
                DropdownMenuItem<String>(value: 'A+', child: Text('A+')),
                DropdownMenuItem<String>(value: 'A-', child: Text('A-')),
                DropdownMenuItem<String>(value: 'B+', child: Text('B+')),
                DropdownMenuItem<String>(value: 'B-', child: Text('B-')),
                DropdownMenuItem<String>(value: 'O+', child: Text('O+')),
                DropdownMenuItem<String>(value: 'O-', child: Text('O-')),
                DropdownMenuItem<String>(value: 'AB+', child: Text('AB+')),
                DropdownMenuItem<String>(value: 'AB-', child: Text('AB-')),
                DropdownMenuItem<String>(
                    value: 'Not Sure', child: Text('Not Sure')),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                  child: Text(
                'Search',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
            )
          ],
        ),
      ),
      )),
      body: Container(color: Colors.amber,)
    );
  }
}
