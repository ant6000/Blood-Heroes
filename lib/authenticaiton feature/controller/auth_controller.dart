import 'package:blood_fighter/authenticaiton%20feature/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../remote repository/auth_repo.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool passwordShow = true.obs;
  RxBool isChecked = false.obs;
  var verificationId = ''.obs;
  RxString phonNumber = ''.obs;
  RxBool isDarkMode = false.obs;
  Rx<UserModel?> userModel = Rx<UserModel?>(null);

  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      await AuthRepo.signIn(email, password);
      showUserInfo(email);
      Get.toNamed('/homePage');
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
      await AuthRepo.signUp(email, password, name, phone, address, bloodGroup);
      Fluttertoast.showToast(msg: 'Account Created Successfully');
      Get.offNamed('/homePage');
    } catch (e) {
      Get.snackbar('Registration Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  Future<void> logOut() async {
    try {
      await AuthRepo.signOut();
      userModel.value = null;
      Get.offNamed('/login');
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Logout Failed',
      );
    }
  }

  void showUserInfo(String email) async {
    try {
      final userDetails = await AuthRepo.getUserDetails(email);
      if (userDetails != null) {
        userModel.value = userDetails;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void toggleDonationStatus(String name, bool currentStatus) async {
    try {
      await AuthRepo.changeDonationstatus(name, currentStatus);
      userModel.update((val) {
        val!.donationStatus = currentStatus;
      });
    } catch (e) {
      debugPrint('Error updating donation status: $e');
    }
  }

  // Future<void> signinWithPhone(String phoneNumber) async {
  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout: const Duration(seconds: 60),
  //       verificationCompleted: (credential) async {
  //         await _auth.signInWithCredential(credential);
  //         debugPrint(
  //             "Phone number automatically verified and user signed in.");
  //       },
  //       verificationFailed: (error) {
  //         debugPrint("Phone number verification failed: ${error.message}");
  //         Get.snackbar('Error', error.toString(),
  //             snackPosition: SnackPosition.BOTTOM);
  //       },
  //       codeSent: (verificationId, forceResendingToken) {
  //         debugPrint("Code sent to the number: $verificationId");
  //         this.verificationId.value = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) {
  //         debugPrint("Auto retrieval timeout: $verificationId");
  //         this.verificationId.value = verificationId;
  //       },
  //     );
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout: const Duration(seconds: 60),
  //       verificationCompleted: (credential) async {
  //         await _auth.signInWithCredential(credential);
  //         debugPrint(
  //             "Phone number automatically verified and user signed in.");
  //       },
  //       verificationFailed: (error) {
  //         debugPrint("Phone number verification failed: ${error.message}");
  //         Get.snackbar('Error', error.toString(),
  //             snackPosition: SnackPosition.BOTTOM);
  //       },
  //       codeSent: (verificationId, forceResendingToken) {
  //         debugPrint("Code sent to the number: $verificationId");
  //         this.verificationId.value = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) {
  //         debugPrint("Auto retrieval timeout: $verificationId");
  //         this.verificationId.value = verificationId;
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // Future<void> signInWithCode(String otp) async {
  //   try {
  //     isLoading(true);
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId.value, smsCode: otp);
  //     await _auth.signInWithCredential(credential);
  //     Get.offNamed('/homePage');
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
