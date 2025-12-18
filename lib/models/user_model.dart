import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String password;

  @HiveField(2)
  String gender;

  @HiveField(3)
  bool agree;

  @HiveField(4)
  bool accept;

  UserModel({
    required this.name,
    required this.password,
    required this.gender,
    required this.agree,
    required this.accept,
  });
}
