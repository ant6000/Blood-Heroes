import 'package:cloud_firestore/cloud_firestore.dart';

class BloodRequestModel {
  String name;
  String gender;
  String address;
  String phone;
  String medicalCondition;
  bool blood;
  bool plasma;
  bool platelets;
  String bloodGroup;
  int quantity;
  String? aditionDetails;
  BloodRequestModel(
     {required this.name,
      required this.gender,
      required this.address,
      required this.phone,
      required this.blood,
      required this.plasma,
      required this.platelets,
      required this.bloodGroup,
      required this.quantity,
      required this.medicalCondition,
      this.aditionDetails});

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'gender' : gender,
      'address' : address,
      'phone' : phone,
      'blood' : blood,
      'plasma' : plasma,
      'platelets' : platelets,
      'bloodGroup' : bloodGroup,
      'quantity' : quantity,
      'medicalCondition' : medicalCondition,
      'aditionDetails' : aditionDetails,
    };
  }

    factory BloodRequestModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return BloodRequestModel(
        name: snapshot['name'],
        gender: snapshot['gender'],
        address: snapshot['address'],
        phone: snapshot['phone'],
        blood: snapshot['blood'],
        plasma: snapshot['plasma'],
        platelets: snapshot['platelets'],
        bloodGroup: snapshot['bloodGroup'],
        quantity: snapshot['quantity'],
        medicalCondition: snapshot['medicalCondition'],
        aditionDetails: snapshot['aditionDetails']);
  }
}
