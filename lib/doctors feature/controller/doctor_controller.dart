import 'package:blood_fighter/doctors%20feature/model/doctor_model.dart';
import 'package:blood_fighter/doctors%20feature/remote%20repository/doctors_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocController extends GetxController {
  RxList<DoctorModel?> doctorsList = RxList<DoctorModel?>();
  RxBool isLoading = RxBool(false);
  RxBool searchComplete = false.obs;

  Future<void> showDoctorList(String location, String department) async {
    try {
      isLoading(true);
      final doctorList =
          await DoctorsRepo.getDoctorsList(location, department);
      final docList = doctorList
          .map((snapshot) => DoctorModel.fromSnapshot(
              snapshot.data() as Map<String, dynamic>))
          .toList();
      doctorsList.clear();
      doctorsList.addAll(docList);
      searchComplete(true);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false); // Set loading back to false
    }
  }
}
