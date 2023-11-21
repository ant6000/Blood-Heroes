import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DoctorsRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static final doctorCollection = 'Doctors List';

static Future<List<QueryDocumentSnapshot>> getDoctorsList(
      String location, String depertment) async {
    final querySnapshot = await _database
        .collection(doctorCollection)
        .where('depertment', isEqualTo: depertment)
        .get();
    final results = querySnapshot.docs.where((doc) {
      final String address = doc['address'].toString().toLowerCase();
      final String depertment = doc['depertment'].toString().toLowerCase();
      return address.contains(location.toLowerCase()) && depertment.contains(depertment.toLowerCase());
    });

    if (results.isNotEmpty) {
      return results.toList();
    } else {
      debugPrint('Doctor repo cant found data');
      return [];
    }
  }
}
