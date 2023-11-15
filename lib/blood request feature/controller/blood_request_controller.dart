import 'package:blood_fighter/blood%20request%20feature/model/blood_request_model.dart';
import 'package:blood_fighter/blood%20request%20feature/remote%20repository/blood_request_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class BloodRequestController extends GetxController {
  Rx<String?> gender = 'null'.obs;
  Rx<bool?> blood = false.obs;
  Rx<bool?> plasma = false.obs;
  Rx<bool?> platelets = false.obs;
  RxBool type = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;
  RxList<BloodRequestModel?> postDatalist = RxList<BloodRequestModel?>();

  Future<void> sendRequest(
      String name,
      String gender,
      String address,
      String phone,
      String medicalCondition,
      bool blood,
      bool plasma,
      bool platelets,
      String bloodGroup,
      int quantity,
      String aditionalDetails) async {
    try {
      isLoading2(true);
      final requestModel = BloodRequestModel(
          name: name,
          gender: gender,
          address: address,
          phone: phone,
          blood: blood,
          plasma: plasma,
          platelets: platelets,
          bloodGroup: bloodGroup,
          quantity: quantity,
          medicalCondition: medicalCondition,
          aditionDetails: aditionalDetails);
      await BloodRequestRepo.addRequest(requestModel);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading2(false);
    }
  }

  Future<void> getRequestPost() async {
    try {
      isLoading.value = true;
      final postList = await BloodRequestRepo.getRequestedPostData();
      if (postList.isNotEmpty) {
        postDatalist.value = postList;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
