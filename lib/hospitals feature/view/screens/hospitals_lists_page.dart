import 'package:blood_fighter/hospitals%20feature/controller/hospital_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/hospital_list_tile.dart';

class HospitalSearchPage extends StatelessWidget {
  HospitalSearchPage({super.key});
  final controller = Get.put(HospitalController());
  final searchController = TextEditingController();
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
                    controller: searchController,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.only(top: 5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: const Icon(Icons.add_home_work_sharp),
                      hintText: 'Enter hospital name or location',
                      hintStyle: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    onChanged: (value) {
                      if (searchController.text.length > 3) {
                        controller.searchHospital(searchController.text);
                      } else {
                        controller.showHospitalList();
                      }
                    },
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
