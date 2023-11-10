import 'package:cloud_firestore/cloud_firestore.dart';

class BloodBankModel {
  String name;
  String location;
  String phone;
  String imageUrl;
  BloodBankModel(
      {required this.name,
      required this.location,
      required this.imageUrl,
      required this.phone});

  factory BloodBankModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return BloodBankModel(
        name: snapshot['name'],
        location: snapshot['address'],
        imageUrl: snapshot['imageUrl'],
        phone: snapshot['phone']);
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'location': location,
  //     'imageUrl': imageUrl,
  //     'phone': phone,
  //   };
  // }
}
