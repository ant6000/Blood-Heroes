
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../remote repository/auth_repo.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(AuthRepo());
  }
}

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo());
    Get.put(AuthController());
  }
}
