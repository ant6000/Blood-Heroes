import 'package:blood_fighter/doctors%20feature/controller/doctor_controller.dart';
import 'package:blood_fighter/doctors%20feature/view/widgets/doctors_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorsPage extends StatelessWidget {
  DoctorsPage({super.key});

  String? depeartment;
  final locationController = TextEditingController();
  final controller = Get.find<DocController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          title: const Text('Search Doctor',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          expandedHeight: 300.h,
          backgroundColor: Colors.red.shade900,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          snap: true,
          pinned: false,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 70),
                      TextFormField(
                        controller: locationController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.location_on),
                            hintText: 'Enter location or Hospital name',
                            errorStyle: const TextStyle(color: Colors.white),
                            hintStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
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
                      DropdownButtonFormField<String>(
                        borderRadius: BorderRadius.circular(20),
                        decoration: InputDecoration(
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                            filled: true,
                            hintStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            prefixIcon: const Icon(
                              Icons.water_drop,
                            ),
                            hintText: 'Select Specialist ',
                            errorStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        value: depeartment,
                        onChanged: (value) {
                          depeartment = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a Sepecialist depeartment';
                          }
                          return null;
                        },
                        items: const [
                          DropdownMenuItem<String>(
                              value: 'Oncologist', child: Text('Oncologist')),
                          DropdownMenuItem<String>(
                              value: 'Gynecologist',
                              child: Text('Gynecologist')),
                          DropdownMenuItem<String>(
                              value: 'Pediatrician',
                              child: Text('Pediatrician')),
                          DropdownMenuItem<String>(
                              value: 'Neurology', child: Text('Neurology')),
                          DropdownMenuItem<String>(
                              value: 'Cardiology', child: Text('Cardiology')),
                          DropdownMenuItem<String>(
                              value: 'Medicine', child: Text('Medicine')),
                          DropdownMenuItem<String>(
                              value: 'Surgery', child: Text('Surgery')),
                          DropdownMenuItem<String>(
                              value: 'Dermatology', child: Text('Dermatology')),
                          DropdownMenuItem<String>(
                              value: 'Nephrologist',
                              child: Text('Nephrologist')),
                          DropdownMenuItem<String>(
                              value: 'Anesthesiologist',
                              child: Text('Anesthesiologist')),
                          DropdownMenuItem<String>(
                              value: 'Otorhinolaryngology',
                              child: Text('Otorhinolaryngology')),
                          DropdownMenuItem<String>(
                              value: 'Endocrinologist',
                              child: Text('Endocrinologist')),
                          DropdownMenuItem<String>(
                              value: 'Gastroenterology',
                              child: Text('Gastroenterology')),
                          DropdownMenuItem<String>(
                              value: 'Geriatrics', child: Text('Geriatrics')),

                        ],
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.showDoctorList(
                                locationController.text, depeartment!);
                          }
                        },
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            'Search',
                            style: TextStyle(
                                fontSize: 30, color: Colors.red.shade900),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(() {
          if (controller.isLoading.value) {
            // Show a loading animation while fetching data
            return const SliverFillRemaining(
              child: Center(
                child:
                    CircularProgressIndicator(), // You can use your custom loading widget
              ),
            );
          } else if (controller.searchComplete.value &&
              controller.doctorsList.isEmpty) {
            return const SliverFillRemaining(
                child: Center(
                    child: Text(
              'No User found',
              style: TextStyle(color: Colors.black),
            )));
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.doctorsList.length,
                (context, index) {
                  return DoctorsTile(
                    name: controller.doctorsList[index]!.name,
                    title: controller.doctorsList[index]!.title,
                    dept: controller.doctorsList[index]!.depertment,
                    address: controller.doctorsList[index]!.address,
                    imageUrl: controller.doctorsList[index]!.imageUrl,
                    phone: controller.doctorsList[index]!.phone,
                  );
                },
              ),
            );
          }
        })
      ],
    ));
  }
}
