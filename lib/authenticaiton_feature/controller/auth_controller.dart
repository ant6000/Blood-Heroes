import 'package:blood_fighters/authenticaiton_feature/remote%20repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool passwordShow = true.obs;
  RxBool isChecked = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      await AuthRepo.signIn(email, password);
      Get.offNamed('/homePage'); // Navigate on successful login
    } catch (e) {
      Get.snackbar(
        'Log-In Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false); // Set loading back to false
    }
  }

  void registration(String email, String password, String name, String phone,
      String address, String bloodGroup) async {
    try {
      isLoading(true);
      AuthRepo.signUp(email, password, name, phone, address, bloodGroup);
      Get.offNamed('/homePage');
    } catch (e) {
      Get.snackbar('Registration Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
