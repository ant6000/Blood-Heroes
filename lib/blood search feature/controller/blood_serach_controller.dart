import 'package:blood_fighter/blood%20search%20feature/model/blood_search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../remote repository/blood_search_repo.dart';

class BloodSearchController extends GetxController {
  RxList<BloodSearchModel?> userList = RxList<BloodSearchModel?>();
  RxBool isLoading = RxBool(false);
  RxBool isloading = false.obs;

  Future<void> showDonorList(String location, String bloodGroup) async {
    try {
      isLoading(true);
      final userDetails =
          await BloodSearchRepo.getDonorList(location, bloodGroup);
      final donorList = userDetails
          .map((snapshot) => BloodSearchModel.fromSnapshot(
              snapshot.data() as Map<String, dynamic>))
          .toList();
      userList.clear();
      userList.addAll(donorList);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false); // Set loading back to false
    }
  }
}
