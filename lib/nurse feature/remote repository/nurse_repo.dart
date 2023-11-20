import 'package:blood_fighter/nurse%20feature/model/nurse_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NurseRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static const String collection = 'Nurses';

  static Future<List<NurseModel>> getNursesData() async {
    final querySnapshot = await _database.collection(collection).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((docSnapshot) => NurseModel.fromSnapshot(docSnapshot))
          .toList();
    } else {
      return [];
    }
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      searchNurse(String query) async {
    final querySnapshot = await _database.collection(collection).get();

    final result = querySnapshot.docs.where((doc) {
      final String name = doc['name'].toString().toLowerCase();
      final String location = doc['address'].toString().toLowerCase();
      return name.contains(query.toLowerCase()) ||
          location.contains(query.toLowerCase());
    });
    if (result.isNotEmpty) {
      return result.toList();
    } else {
      debugPrint('Repo cant found data');
      return [];
    }
  }
}
