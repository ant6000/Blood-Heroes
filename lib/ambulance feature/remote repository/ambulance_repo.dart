import 'package:blood_fighter/ambulance%20feature/model/ambulance_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AmbulanceRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static const String collection = 'Ambulance';

  static Future<List<AmbulanceModel>> getAmbulanceData() async {
    final querySnapshot = await _database.collection(collection).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((docSnapshot) => AmbulanceModel.fromSnapshot(docSnapshot))
          .toList();
    } else {
      return [];
    }
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      searchAmbulance(String query) async {
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
