import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/user_card.dart';

class BloodSearchPage extends StatelessWidget {
  BloodSearchPage({super.key});
  String? bloodGroup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 300),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.red.shade900,
              ),
              child: Column(
                children: [
                  AppBar(
                    title: const Text(
                      ' Search Blood ',
                      style: TextStyle(color: Colors.white),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.red.shade900,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.location_pin,
                          color: Colors.black,
                        ),
                        label: const Text('Enter Location specific area',
                            style: TextStyle(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonFormField<String>(
                      borderRadius: BorderRadius.circular(20),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.water_drop,
                            color: Colors.black,
                          ),
                          label: const Text('Select Patient Blood Group',
                              style: TextStyle(color: Colors.black)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1))),
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
                        DropdownMenuItem<String>(
                            value: 'A+', child: Text('A+')),
                        DropdownMenuItem<String>(
                            value: 'A-', child: Text('A-')),
                        DropdownMenuItem<String>(
                            value: 'B+', child: Text('B+')),
                        DropdownMenuItem<String>(
                            value: 'B-', child: Text('B-')),
                        DropdownMenuItem<String>(
                            value: 'O+', child: Text('O+')),
                        DropdownMenuItem<String>(
                            value: 'O-', child: Text('O-')),
                        DropdownMenuItem<String>(
                            value: 'AB+', child: Text('AB+')),
                        DropdownMenuItem<String>(
                            value: 'AB-', child: Text('AB-')),
                        DropdownMenuItem<String>(
                            value: 'All', child: Text('All')),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Search',
                        style:
                            TextStyle(fontSize: 30, color: Colors.red.shade900),
                      )),
                    ),
                  )
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
              SizedBox(height: 10),
              UserCard(),
            ],
          ),
        ));
  }
}
