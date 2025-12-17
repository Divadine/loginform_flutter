class UserModel {
  int? id;
  String firstName;
  String phone;
  String password;
  String state;
  String city;
  String gender;
  bool agree;
  bool accept;

  UserModel({
    this.id,
    required this.firstName,
    required this.gender,
    required this.phone,
    required this.password,
    required this.state,
    required this.city,
    required this.agree,
    required this.accept,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'phone': phone,
      'password': password,
      'state': state,
      'city': city,
      'gender': gender,
      'agree': agree ? 1 : 0,
      'accept': accept ? 1 : 0,
    };
  }
}
