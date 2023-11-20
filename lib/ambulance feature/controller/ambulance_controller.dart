import 'package:blood_fighter/ambulance%20feature/model/ambulance_model.dart';
import 'package:blood_fighter/ambulance%20feature/remote%20repository/ambulance_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmbulanceController extends GetxController {
  RxBool isloading = false.obs;
  RxBool notFound = false.obs;
  RxList<AmbulanceModel?> nurseList = RxList<AmbulanceModel?>();

  Future<void> showAmbulanceList() async {
    try {
      isloading.value = true;
      final data = await AmbulanceRepo.getAmbulanceData();
      if (data.isNotEmpty) {
        nurseList.value = data;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> searchAmbulance(String query) async {
    try {
      final searchResults = await AmbulanceRepo.searchAmbulance(query);

      final resultList =
          searchResults.map((doc) => AmbulanceModel.fromSnapshot(doc)).toList();

      if (searchResults.isEmpty) {
        notFound(true);
      } else {
        notFound(false);
        nurseList.value = resultList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
