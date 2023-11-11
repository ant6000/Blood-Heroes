import 'package:blood_fighters/hospitals%20feature/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../remote repository/hospital_remote_repo.dart';

class HospitalController extends GetxController {
  RxBool isloading = false.obs;
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

  // Future<void> launchDialpad(String phoneNumber) async {

  //  Uri phoneno = Uri.parse('tel:+97798345348734');
  //   if (await canLaunchUrl(phoneno)) {
  //     launchDialpad(phoneNumber);
  //   } else {
  //     throw 'Could not launch $phoneno';
  //   }
  // }
}
