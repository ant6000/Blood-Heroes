import 'package:blood_fighters/authenticaiton%20feature/model/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  RxBool donationStatus = false.obs;
}
