class UserModel {
  String name;
  String phone;
  String address;
  String email;
  String password;
  String bloodGroup;
  String? imageUrl;
  bool donationStatus;
  UserModel(
      {required this.name,
      required this.phone,
      required this.address,
      required this.email,
      required this.password,
      required this.bloodGroup,
      this.imageUrl = '',
      this.donationStatus = false
      });

  factory UserModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return UserModel(
        name: snapshot['name'],
        phone: snapshot['phone'],
        address: snapshot['address'],
        email: snapshot['email'],
        password: snapshot['password'],
        bloodGroup: snapshot['bloodgroup'],
        imageUrl: snapshot['imageUrl'],
        donationStatus: snapshot['donationStatus'],
        );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'email': email,
      'password': password,
      'bloodgroup': bloodGroup,
      'imageUrl': imageUrl,
      'donationStatus': donationStatus,
    };
  }
}
