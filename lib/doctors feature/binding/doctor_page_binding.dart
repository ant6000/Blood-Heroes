import 'package:blood_fighter/doctors%20feature/controller/doctor_controller.dart';
import 'package:get/get.dart';

class DoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DocController());
  }
}
