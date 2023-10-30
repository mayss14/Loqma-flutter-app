class UserModel {
  String name;
  String phoneNumber;
  String uid;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',

    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uid": uid,
      "phoneNumber": phoneNumber,
     
    };
  }
}
