import 'package:blood_fighter/blood%20request%20feature/model/blood_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BloodRequestRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String collectionUser = 'Blood Requests';

  static Future<void> addRequest(BloodRequestModel requestModel) async {
    _database
        .collection(collectionUser)
        .doc(requestModel.name)
        .set(requestModel.toMap())
        .catchError((e) => debugPrint(e.toString()));
  }

    static Future<List<BloodRequestModel>> getRequestedPostData() async {
    final querySnapshot = await _database.collection(collectionUser).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((docSnapshot) => BloodRequestModel.fromSnapshot(docSnapshot))
          .toList();
    } else {
      return [];
    }
  }
}
