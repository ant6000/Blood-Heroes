import 'package:blood_fighter/blood%20banks%20feature/controller/blood_bank_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/blood_bank_tile.dart';

class BloodBankPage extends StatelessWidget {
  BloodBankPage({super.key});
  final controller = Get.put(BloodBankController());
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.showBloodBankList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.red.shade900,
            centerTitle: true,
            title: const Text(
              'Blood Banks',
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
                        controller.searchBloodBank(searchController.text);
                      } else {
                        controller.notFound(false);
                        controller.showBloodBankList();
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
                'No Blood bank found',
                style: TextStyle(color: Colors.black),
              )));
            } else {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: controller.bloodBankList.length,
                      (context, index) {
                return BloodBankTile(
                  name: controller.bloodBankList[index]?.name.toString() ?? '',
                  location:
                      controller.bloodBankList[index]?.location.toString() ??
                          '',
                  number:
                      controller.bloodBankList[index]?.phone.toString() ?? '',
                );
              }));
            }
          })
        ],
      ),
    );
  }
}
