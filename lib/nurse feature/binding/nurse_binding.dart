import 'package:blood_fighter/nurse%20feature/controller/nurse_controller.dart';
import 'package:get/get.dart';

class NursePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NurseController());
  }
}
