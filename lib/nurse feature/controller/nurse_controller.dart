import 'package:blood_fighter/nurse%20feature/model/nurse_model.dart';
import 'package:blood_fighter/nurse%20feature/remote%20repository/nurse_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NurseController extends GetxController {
  RxBool isloading = false.obs;
  RxBool notFound = false.obs;
  RxList<NurseModel?> nurseList = RxList<NurseModel?>();

  Future<void> showNurseList() async {
    try {
      isloading.value = true;
      final data = await NurseRepo.getNursesData();
      if (data.isNotEmpty) {
        nurseList.value = data;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> searchNurse(String query) async {
    try {
      final searchResults = await NurseRepo.searchNurse(query);

      final resultList =
          searchResults.map((doc) => NurseModel.fromSnapshot(doc)).toList();

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
