import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodRequestPage extends StatelessWidget {
  BloodRequestPage({super.key});
  final formkey = GlobalKey<FormState>();
  String? condition;
  String? selectedBloodGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: const Text(
          'Blood Request',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: formkey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.abc),
                    label: const Text('Enter Patient name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.local_hospital_rounded),
                    label: const Text('Enter Hospital Address'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    label: const Text('Enter Contact number'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.water_drop),
                    label: const Text('Select your blood group'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                value: condition,
                onChanged: (value) {
                  condition = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Patient Medical condition';
                  }
                  return null;
                },
                items: const [
                  DropdownMenuItem<String>(
                      value: 'Emergency', child: Text('Emergency')),
                  DropdownMenuItem<String>(
                      value: 'Severe', child: Text('Severe')),
                  DropdownMenuItem<String>(value: 'Good', child: Text('Good')),
                ],
              ),
              DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.water_drop),
                    label: const Text('Select Patient Blood Group'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                value: selectedBloodGroup,
                onChanged: (value) {
                  selectedBloodGroup = value;
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
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 5,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      label: const Text('Aditional Details'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                      return 'Enter a valid email address';
                    } else {
                      return null;
                    }
                  }),
              Container(
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                    color: Colors.red.shade900,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text('Register',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
