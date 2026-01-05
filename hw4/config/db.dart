import 'package:sqlite3/sqlite3.dart';

class DBConfig {
  static final DBConfig _instance = DBConfig._internal();
  factory DBConfig() => _instance;
  DBConfig._internal();

  late final Database db;

  void init(String dbPath) {
    db = sqlite3.open(dbPath);

    db.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER,
        studentCode TEXT,
        gpa REAL
      );
    ''');
  }

  void close() {
    db.dispose();
  }
}
