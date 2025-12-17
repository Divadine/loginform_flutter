import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _database;

  // Getter to get DB instance
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Initialize DB
  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'user.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT,
            gender TEXT,
            phone TEXT,
            password TEXT,
            state TEXT,
            city TEXT,
            agree INTEGER,
            accept INTEGER
          )
        ''');
      },
    );
  }

  // ✅ Add this method inside the DbHelper class
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;       // get the database instance
    return await db.query('users');  // SELECT * FROM users
  }
}
