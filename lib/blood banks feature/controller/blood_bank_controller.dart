import 'package:blood_fighter/blood%20banks%20feature/model/blood_bank_model.dart';
import 'package:blood_fighter/blood%20banks%20feature/remote%20repository/blood_bank_remote_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodBankController extends GetxController {
  RxBool isloading = false.obs;
  RxBool notFound = false.obs;
  RxList<BloodBankModel?> bloodBankList = RxList<BloodBankModel?>();

  Future<void> showBloodBankList() async {
    try {
      isloading.value = true;
      final banklist = await BloodBankRepo.getBloodBankData();
      if (banklist.isNotEmpty) {
        bloodBankList.value = banklist;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> searchBloodBank(String query) async {
    try {
      final searchResults = await BloodBankRepo.searchBloodBank(query);

      final resultList =
          searchResults.map((doc) => BloodBankModel.fromSnapshot(doc)).toList();

      if (searchResults.isEmpty) {
        notFound(true);
      } else {
        notFound(false);
        bloodBankList.value = resultList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
