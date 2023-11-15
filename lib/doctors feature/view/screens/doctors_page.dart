import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsPage extends StatelessWidget {
  DoctorsPage({super.key});
  final formKey = GlobalKey<FormState>();
  String? doctors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          title: const Text('Search Doctors',
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
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.location_on),
                            hintText: 'Enter Hospital name',
                            errorStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
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
                      //const SizedBox(height: 70),
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
                            hintText: 'Select Depertment',
                            errorStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        value: doctors,
                        onChanged: (value) {
                          doctors = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a depertment';
                          }
                          return null;
                        },
                        items: const [
                          DropdownMenuItem<String>(
                              value: 'Internal medicine',
                              child: Text('Internal medicine')),
                          DropdownMenuItem<String>(
                              value: 'A-', child: Text('Ophthalmology')),
                          DropdownMenuItem<String>(
                              value: 'B+', child: Text('Dermatology')),
                          DropdownMenuItem<String>(
                              value: 'B-', child: Text('Gastroenterology')),
                          DropdownMenuItem<String>(
                              value: 'O+', child: Text('Neurology')),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {}
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          child: Center(
            child: Text(
              'Comming soon',
              style: TextStyle(fontSize: 20.sp, color: Colors.red.shade900),
            ),
          ),
        )
      ],
    ));
  }
}
