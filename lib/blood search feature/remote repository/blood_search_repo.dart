import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class BloodSearchRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String collectionUser = 'User Data';

  static Future<List<QueryDocumentSnapshot>> getDonorList(
      String location, String bloodGroup) async {
    final querySnapshot = await _database
        .collection(collectionUser)
        .where('bloodgroup', isEqualTo: bloodGroup)
        .get();
    final results = querySnapshot.docs.where((doc) {
      final String address = doc['address'].toString().toLowerCase();
       final bool donationStatus = doc['donationStatus'] ?? false; 
      return address.contains(location.toLowerCase()) && donationStatus;
    });

    if (results.isNotEmpty) {
      return results.toList()  ;
    } else {
      debugPrint('repo cant found data');
      return [];
    }
  }
}
