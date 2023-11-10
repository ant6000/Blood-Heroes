import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalModel {
  String name;
  String location;
  String phone;
  String imageUrl;
  String type;
  HospitalModel(
      {required this.name,
      required this.location,
      required this.imageUrl,
      required this.phone,
      required this.type});

  factory HospitalModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return HospitalModel(
        name: snapshot['name'],
        location: snapshot['address'],
        imageUrl: snapshot['imageurl'],
        phone: snapshot['phone'],
        type: snapshot['type']);
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'location': location,
  //     'imageUrl': imageUrl,
  //     'phone': phone,
  //     'type': type,
  //   };
  // }
}
