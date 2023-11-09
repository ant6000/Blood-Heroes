

class BloodSearchModel {
  String name;
  String location;
  String bloodGroup;
  String number;
  //String imageUrl;
  BloodSearchModel(
      {required this.name,
      required this.location,
      required this.number,
      required this.bloodGroup,
      //required this.imageUrl
      });

  factory BloodSearchModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return BloodSearchModel(
        name: snapshot['name'],
        location: snapshot['address'],
        number: snapshot['phone'],
        bloodGroup: snapshot['bloodgroup'],
        //imageUrl: snapshot['imageUrl']
        );
  }
}
