import 'package:blood_fighter/authenticaiton%20feature/controller/auth_controller.dart';
import 'package:blood_fighter/authenticaiton%20feature/remote%20repository/auth_repo.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo());
    Get.put(AuthController());
  }
}

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo());
    Get.put(AuthController());
  }
}
