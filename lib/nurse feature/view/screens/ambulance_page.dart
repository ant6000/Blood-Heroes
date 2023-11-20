import 'package:blood_fighter/nurse%20feature/controller/nurse_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/nurse_tile.dart';

class NursePage extends StatelessWidget {
  NursePage({super.key});
  final controller = Get.find<NurseController>();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.showNurseList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.red.shade900,
            centerTitle: true,
            title: const Text(
              'Nurses',
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
                    controller: searchController,
                    decoration: InputDecoration(
                        fillColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.black
                                : Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.only(top: 5),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.location_pin),
                        hintText: 'Enter Location'),
                    onChanged: (value) {
                      if (searchController.text.length >= 3) {
                        controller.searchNurse(searchController.text);
                      } else {
                        controller.notFound(false);
                        controller.showNurseList();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            if (controller.isloading.value) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (controller.notFound.value) {
              return const SliverFillRemaining(
                  child: Center(
                      child: Text(
                'No nurse found',
                style: TextStyle(color: Colors.black),
              )));
            } else {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: controller.nurseList.length,
                      (context, index) {
                return NurseTile(
                  name: controller.nurseList[index]?.name.toString() ?? '',
                  location:
                      controller.nurseList[index]?.location.toString() ??
                          '',
                  number:
                      controller.nurseList[index]?.phone.toString() ?? '',
                );
              }));
            }
          })
        ],
      ),
    );
  }
}
