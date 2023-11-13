import 'package:blood_fighter/blood%20search%20feature/controller/blood_serach_controller.dart';
import 'package:blood_fighter/blood%20search%20feature/view/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BloodSearchPage extends StatefulWidget {
  const BloodSearchPage({super.key});

  @override
  State<BloodSearchPage> createState() => _BloodSearchPageState();
}

class _BloodSearchPageState extends State<BloodSearchPage> {
  String? bloodGroup;

  final formKey = GlobalKey<FormState>();

  final locationController = TextEditingController();

  final searchController = Get.put(BloodSearchController());

  @override
  void dispose() {
    locationController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: true,
          title:
              const Text('Search Blood', style: TextStyle(color: Colors.white)),
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
                            hintText: 'Enter Thana, Division',
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
                            hintText: 'Select your blood group',
                            errorStyle: const TextStyle(color: Colors.white),
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
                        ],
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            searchController.showDonorList(
                                locationController.text, bloodGroup!);
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
        // Obx(() {
        //   if (searchController.isLoading.value) {
        //     return SliverFillRemaining(child: const Center(child: CircularProgressIndicator()));
        //   } else {
        //     return SliverList(
        //         delegate: SliverChildBuilderDelegate((context, index) =>
        //             UserCard(
        //                 name: searchController.userList[index]!.name,
        //                 location: searchController.userList[index]!.location,
        //                 bloodGroup:
        //                     searchController.userList[index]!.bloodGroup,
        //                 number: searchController.userList[index]!.number)));
        //   }
        // searchController.isLoading.value
        //     ? const Center(child: CircularProgressIndicator())
        //     : SliverList(
        //         delegate: SliverChildBuilderDelegate((context, index) =>
        //             UserCard(
        //                 name: searchController.userList[index]!.name,
        //                 location: searchController.userList[index]!.location,
        //                 bloodGroup:
        //                     searchController.userList[index]!.bloodGroup,
        //                 number: searchController.userList[index]!.number)));
        //})
        Obx(() {
          if (searchController.isLoading.value) {
            // Show a loading animation while fetching data
            return const SliverFillRemaining(
              child: Center(
                child:
                    CircularProgressIndicator(), // You can use your custom loading widget
              ),
            );
          } else if (searchController.searchComplete.value &&
              searchController.userList.isEmpty) {
            return const SliverFillRemaining(
                child: Center(child: Text('No User found',style: TextStyle(color: Colors.black),)));
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: searchController.userList.length,
                (context, index) {
                  return UserCard(
                    name: searchController.userList[index]!.name,
                    location: searchController.userList[index]!.location,
                    bloodGroup: searchController.userList[index]!.bloodGroup,
                    number: searchController.userList[index]!.number,
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
