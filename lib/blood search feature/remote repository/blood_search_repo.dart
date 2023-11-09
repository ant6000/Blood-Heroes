import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class BloodSearchRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String collectionUser = 'User Data';

  static Future<List<DocumentSnapshot>> getDonorList(
      String location, String bloodGroup) async {
    final querySnapshot = await _database
        .collection(collectionUser)
         .where('address', isEqualTo: location)
        .where('bloodgroup', isEqualTo: bloodGroup)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs;
    } else {
      debugPrint('repo cant found data');
      return [];
    }
  }
}
