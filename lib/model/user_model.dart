class UserInfo {
  String name;
  String phone;
  String address;
  String email;
  String password;
  String? imageUrl;
  UserInfo({
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.password,
    this.imageUrl
  });
}
