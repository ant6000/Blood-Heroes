import 'package:blood_fighters/blood%20banks%20feature/model/blood_bank_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BloodBankRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static const String collection = 'Blood Banks';

  static Future<List<BloodBankModel>> getBloodBankData() async {
    final querySnapshot = await _database.collection(collection).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((docSnapshot) => BloodBankModel.fromSnapshot(docSnapshot))
          .toList();
    } else {
      return [];
    }
  }
}
