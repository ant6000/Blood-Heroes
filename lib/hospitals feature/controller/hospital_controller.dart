import 'package:blood_fighter/hospitals%20feature/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../remote repository/hospital_remote_repo.dart';

class HospitalController extends GetxController {
  RxBool isloading = false.obs;
  RxBool notFound = false.obs;
  RxList<HospitalModel?> hospitalList = RxList<HospitalModel?>();

  Future<void> showHospitalList() async {
    try {
      isloading.value = true;
      final hospital_list = await HospitalRepo.getHospitailsData();
      if (hospital_list.isNotEmpty) {
        hospitalList.value = hospital_list;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> searchHospital(String query) async {
    try {
      final searchResults = await HospitalRepo.searchHospital(query);

      final resultList =
          searchResults.map((doc) => HospitalModel.fromSnapshot(doc)).toList();

      if (searchResults.isEmpty) {
        notFound(true);
      } else {
        notFound(false);
        hospitalList.value = resultList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
