import 'package:blood_fighters/hospitals%20feature/model/hospital_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static const String collection = 'Hospitals';

  static Future<List<HospitalModel>> getHospitailsData() async {
    final querySnapshot = await _database.collection(collection).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((docSnapshot) => HospitalModel.fromSnapshot(docSnapshot))
          .toList();
    } else {
      return [];
    }
  }

  static Future <List<QueryDocumentSnapshot<Map<String, dynamic>>>> searchHospital(
      String query) async {
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
      print('Repo cant found data');
      return [];
    }
  }
}
