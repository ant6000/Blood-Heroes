
class DoctorModel {
  String name;
  String title;
  String address;
  String depertment;
  String imageUrl;
  String phone;

  DoctorModel(
      {required this.name,
      required this.title,
      required this.address,
      required this.phone,
      required this.imageUrl,
      required this.depertment});

  factory DoctorModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return DoctorModel(
      name: snapshot['name'],
      title: snapshot['title'],
      phone: snapshot['phone'],
      depertment: snapshot['depertment'],
      address: snapshot['address'],
      imageUrl: snapshot['imageUrl'],
    );
  }
}
