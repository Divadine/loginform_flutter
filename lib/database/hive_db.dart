import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_model.dart';

class HiveDB {
  static Box<UserModel>? _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter()); // THIS IS CRUCIAL
    _box = await Hive.openBox<UserModel>('users');
  }

  static Box<UserModel> get box {
    if (_box == null) {
      throw Exception('HiveDB not initialized. Call HiveDB.init() first.');
    }
    return _box!;
  }
}
