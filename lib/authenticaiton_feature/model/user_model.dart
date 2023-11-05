import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  String name;
  String phone;
  String address;
  String email;
  String password;
  String bloodGroup;
  String? imageUrl;
  UserModel(
      {required this.name,
      required this.phone,
      required this.address,
      required this.email,
      required this.password,
      required this.bloodGroup,
      this.imageUrl});

  factory UserModel.fromSnapshot(
      Map<String, dynamic> snapshot) {
    return UserModel(
        name: snapshot['name'],
        phone: snapshot['phone'],
        address: snapshot['address'],
        email: snapshot['email'],
        password: snapshot['password'],
        bloodGroup: snapshot['bloodgroup']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'email': email,
      'password': password,
      'bloodgroup': bloodGroup,
    };
  }
}
