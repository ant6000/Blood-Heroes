import 'package:blood_fighters/hospitals%20feature/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../remote repository/hospital_remote_repo.dart';

class HospitalController extends GetxController {
  RxList<HospitalModel?> hospitalList = RxList<HospitalModel?>();

  Future<void> showHospitalList() async {
    try {
      final hospital_list = await HospitalRepo.getHospitailsData();
      print(hospital_list);
      if (hospital_list.isNotEmpty) {
        hospitalList.value = hospital_list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
