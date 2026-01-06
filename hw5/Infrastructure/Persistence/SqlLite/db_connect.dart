import 'package:sqlite3/sqlite3.dart';

class DbConnection {
  static final DbConnection _instance = DbConnection._internal();
  factory DbConnection() => _instance;
  DbConnection._internal();

  late final Database db;

  void init(String dbPath) {
    db = sqlite3.open(dbPath);
    _createTables();
    final result = db.select('SELECT * FROM students');
  for (final row in result) {
    print(row); 
  }
    
    
  }

  void _createTables() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        age INTEGER,
        ban TEXT DEFAULT 'unbaned',
        studentCode TEXT,
        gpa REAL,
        createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      );
    ''');
  }

  Database get database => db;

  void close() => db.dispose();
}
