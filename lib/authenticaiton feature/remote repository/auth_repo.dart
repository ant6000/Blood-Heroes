import 'package:blood_fighter/authenticaiton%20feature/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String collectionUser = 'User Data';
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static String verificationId = "";

  static Future<void> signUp(String email, String password, String name,
      String phone, String address, String bloodGroup) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (credential.user != null) {
      final userModel = UserModel(
          email: email,
          password: password,
          name: name,
          phone: phone,
          address: address,
          bloodGroup: bloodGroup);
      await addDetails(userModel);
    }
  }

  static Future<void> addDetails(UserModel userModel) async {
    _database
        .collection(collectionUser)
        .doc(userModel.name)
        .set(userModel.toMap())
        .catchError((e) => debugPrint(e.toString()));
  }

  static Future<void> changeDonationstatus(String name, bool newStatus) async {
    await _database
        .collection(collectionUser)
        .doc(name)
        .update({'donationStatus': newStatus});
  }

  static Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // static Future<void> signinWithPhone(String phoneNumber) async {
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: const Duration(seconds: 60),
  //     verificationCompleted: (credential) async {
  //       await _auth.signInWithCredential(credential);
  //       debugPrint("Phone number automatically verified and user signed in.");
  //     },
  //     verificationFailed: (error) {
  //       debugPrint("Phone number verification failed: ${error.message}");
  //     },
  //     codeSent: (verificationId, forceResendingToken) {
  //       debugPrint("Code sent to the number: $verificationId");
  //       AuthRepo.verificationId = verificationId;
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {
  //       debugPrint("Auto retrieval timeout: $verificationId");
  //       AuthRepo.verificationId = verificationId;
  //     },
  //   );
  // }

  // static Future<void> signInWithCode(String otp) async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId, smsCode: otp);
  //   await _auth.signInWithCredential(credential);
  //   debugPrint("User signed in with the code.");
  // }

  static Future<UserModel?> getUserDetails(String email) async {
    try {
      final querySnapshot = await _database
          .collection(collectionUser)
          .where('email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot userDocument = querySnapshot.docs.first;
        final Map<String, dynamic> userData =
            userDocument.data() as Map<String, dynamic>;
        return UserModel.fromSnapshot(userData);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('repo Error fetching user data: $e');
      return null;
    }
  }
}
