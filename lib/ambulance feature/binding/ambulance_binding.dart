import 'package:blood_fighter/ambulance%20feature/controller/ambulance_controller.dart';
import 'package:get/get.dart';

class AmbulancePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AmbulanceController());
  }
}
