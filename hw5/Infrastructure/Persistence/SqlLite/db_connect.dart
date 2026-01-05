import 'package:sqlite3/sqlite3.dart';

class DBConnect {
  static final DBConnect _instance = DBConnect._internal();
  late Database _db;

  factory DBConnect() {
    return _instance;
  }

  DBConnect._internal() {
    _db = sqlite3.open('my_database.db');
  }

  Database get database => _db;

  void close() {
    _db.dispose();
  }
}
