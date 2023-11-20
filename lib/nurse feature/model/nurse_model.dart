import 'package:cloud_firestore/cloud_firestore.dart';

class NurseModel {
  String name;
  String location;
  String phone;
  String imageUrl;
  NurseModel(
      {required this.name,
      required this.location,
      required this.imageUrl,
      required this.phone});

  factory NurseModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return NurseModel(
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
