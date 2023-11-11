import 'package:blood_fighters/blood%20banks%20feature/controller/blood_bank_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/blood_bank_tile.dart';

class BloodBankPage extends StatelessWidget {
  BloodBankPage({super.key});
  final controller = Get.put(BloodBankController());

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
                        prefixIcon: const Icon(Icons.local_hospital),
                        hintText: 'Enter Location'),
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            return controller.isloading.value
                ? const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: controller.bloodBankList.length,
                        (context, index) {
                    return BloodBankTile(
                      name: controller.bloodBankList[index]?.name.toString() ??
                          '',
                      location: controller.bloodBankList[index]?.location
                              .toString() ??
                          '',
                      number:
                          controller.bloodBankList[index]?.phone.toString() ??
                              '',
                    );
                  }));
          })
        ],
      ),
    );
  }
}
