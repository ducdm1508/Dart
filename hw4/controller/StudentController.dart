import '../model/student.dart';
import '../config/db.dart';
import 'package:sqlite3/sqlite3.dart';

class StudentController {
  final Database db = DBConfig().db;

  void add(Student st) {
    db.execute(
      'INSERT INTO students (id, name, age, studentCode, gpa) VALUES (?, ?, ?, ?, ?);',
      [st.id, st.name, st.age, st.studentCode, st.gpa],
    );
    print("Add success");
  }

  void getById(int id) {
    final ResultSet result = db.select('SELECT * FROM students WHERE id = ?;', [
      id,
    ]);
    if (result.isEmpty) {
      print("Not found");
      return;
    }
    for (final row in result) {
      print("ID: ${row['id']}");
      print("Name: ${row['name']}");
      print("Age: ${row['age']}");
      print("StudentCode: ${row['studentCode']}");
      print("GPA: ${row['gpa']}");
    }
  }

  void update(int id, Student st) {
    db.execute(
      'UPDATE students SET name = ?, age = ?, studentCode = ?, gpa = ? WHERE id = ?;',
      [st.name, st.age, st.studentCode, st.gpa, id],
    );
    print("Update success");
  }

  void delete(int id) {
    db.execute('DELETE FROM students WHERE id = ?;', [id]);
    print("Delete success");
  }

  void displayStudents() {
    final ResultSet result = db.select('SELECT * FROM students;');
    for (final row in result) {
      print("ID: ${row['id']}");
      print("Name: ${row['name']}");
      print("Age: ${row['age']}");
      print("StudentCode: ${row['studentCode']}");
      print("GPA: ${row['gpa']}");
      print("---------------------");
    }
  }
}
