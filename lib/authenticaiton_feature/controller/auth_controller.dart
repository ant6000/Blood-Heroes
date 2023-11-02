import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);
  RxBool isLoading = false.obs; // Add a loading indicator
  RxBool passwordShow = true.obs;
  RxBool isChecked = false.obs;

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      isLoading(true); // Set loading to true while authenticating
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offNamed('/homePage'); // Navigate on successful login
    } catch (e) {
      Get.snackbar(
        'Sign-In Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false); // Set loading back to false
    }
  }
}
