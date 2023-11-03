import 'package:blood_fighters/authenticaiton_feature/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String collectionUser = 'User Data';

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signUp(String email, String password, String name,
      String phone, String address, String bloodGroup) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //final User? firebaseUser = credential.user;
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
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> addDetails(UserModel userModel) async {
    _database
        .collection(collectionUser)
        .doc(userModel.name)
        .set(userModel.toMap())
        .catchError((e) => debugPrint(e.toString()));
  }

  static Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
