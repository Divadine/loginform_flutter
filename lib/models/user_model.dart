import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String gender;

  @HiveField(3)
  String password;

  @HiveField(4)
  bool agree;

  @HiveField(5)
  bool accept;

  @HiveField(6)
  String? imagePath;

  UserModel({
    required this.name,
    required this.phone,
    required this.gender,
    required this.password,
    required this.agree,
    required this.accept,
    this.imagePath,
  });
}
