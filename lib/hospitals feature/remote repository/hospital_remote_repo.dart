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
}
