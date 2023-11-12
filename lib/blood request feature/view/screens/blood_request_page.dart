import 'package:blood_fighters/blood%20request%20feature/controller/blood_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BloodRequestPage extends StatelessWidget {
  BloodRequestPage({super.key});
  final formkey = GlobalKey<FormState>();
  String? bloodGroup;
  String? patientCondition;
  final bloodRequestController = Get.put(BloodRequestController());

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Enter correct name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10.h),
              Obx(
                () {
                  return Row(
                    children: [
                      const Text('Gender'),
                      Radio<String>(
                        value: 'Male',
                        groupValue: bloodRequestController.gender.value,
                        onChanged: (value) {
                          bloodRequestController.gender.value = value;
                        },
                      ),
                      const Text('Male'),
                      Radio<String>(
                        value: 'Female',
                        groupValue: bloodRequestController.gender.value,
                        onChanged: (value) {
                          bloodRequestController.gender.value = value;
                        },
                      ),
                      const Text('Female'),
                      Radio<String>(
                        value: 'Others',
                        groupValue: bloodRequestController.gender.value,
                        onChanged: (value) {
                          bloodRequestController.gender.value = value;
                        },
                      ),
                      const Text('Others'),
                    ],
                  );
                },
              ),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.local_hospital_rounded),
                    label: const Text('Enter Hospital Address'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-zA-Z0-9, -]+$').hasMatch(value)) {
                    return 'Enter a valid location';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10.h),
              TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      label: const Text('Enter Contact number'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^1[3456789]\d{8}$').hasMatch(value)) {
                      return 'Enter a valid BD phone number';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(height: 10.h),
              DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.light_mode_sharp),
                    label: const Text('Patient Medical condition'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                value: patientCondition,
                onChanged: (value) {
                  patientCondition = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a medical conditation';
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
              SizedBox(height: 10.h),
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: bloodRequestController.blood.value,
                        onChanged: (value) {
                          bloodRequestController.blood.value = value;
                        },
                      ),
                      const Text('Blood'),
                      Checkbox(
                        value: bloodRequestController.plasma.value,
                        onChanged: (value) {
                          bloodRequestController.plasma.value = value;
                        },
                      ),
                      const Text('Plasma'),
                      Checkbox(
                        value: bloodRequestController.platelets.value,
                        onChanged: (value) {
                          bloodRequestController.platelets.value = value;
                          formkey.currentState!.validate();
                        },
                      ),
                      const Text('platelets'),
                    ],
                  )),
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
                ],
              ),
              SizedBox(height: 10.h),
              TextFormField(
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                      label: const Text('Blood Quantity (bag)'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[1-9]$').hasMatch(value)) {
                      return 'Max blood quantity limit 10';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(height: 10.h),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                maxLines: 3,
                decoration: InputDecoration(
                    label: const Text('Aditional Details'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    print('success');
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text('Request for Blood',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
