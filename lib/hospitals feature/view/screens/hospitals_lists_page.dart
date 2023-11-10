import 'package:blood_fighters/hospitals%20feature/controller/hospital_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/hospital_list_tile.dart';

class HospitalSearchPage extends StatelessWidget {
  HospitalSearchPage({super.key});
  final controller = Get.put(HospitalController());
  @override
  Widget build(BuildContext context) {
    controller.showHospitalList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.red.shade900,
            centerTitle: true,
            title: const Text(
              'Hospitals',
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
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.only(top: 5),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.yellow.shade900),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.local_hospital),
                        hintText: 'Enter hospital name or location'),
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            return controller.isloading.value
                ? const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: controller.hospitalList.length,
                        (context, index) {
                    return HospitalListTile(
                      name: controller.hospitalList[index]?.name ?? '',
                      location: controller.hospitalList[index]?.location ?? '',
                      number: controller.hospitalList[index]?.phone ?? '',
                      type: controller.hospitalList[index]?.type ?? '',
                      imageUrl: controller.hospitalList[index]?.imageUrl ?? '',
                    );
                  }));
          })
        ],
      ),
    );
  }
}
