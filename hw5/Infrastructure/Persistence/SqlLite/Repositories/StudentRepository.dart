import '../../../../Application/Interfaces/IStudentRepository.dart';
import '../../../../Domain/Entities/student.dart';
import '../db_connect.dart';

class StudentRepository implements IStudentRepository {
  final DbConnection _dbConnection = DbConnection();

  @override
  Future<void> addStudent(Student student) async {
    _dbConnection.database.execute(
      '''
      INSERT INTO students (name, email, age, studentCode, gpa, ban )
      VALUES (?, ?, ?, ?, ?, ?);
      ''',
      [
        student.name,
        student.email,
        student.age,
        student.studentCode,
        student.gpa,
        student.ban,
      ],
    );
  }

  @override
  Future<void> deleteStudent(int id) async {
    _dbConnection.database.execute(
      'DELETE FROM students WHERE id = ?;',
      [id],
    );
  }

  @override
  Future<List<Student>> getAllStudents() async {
    final resultSet = _dbConnection.database.select('''
      SELECT id, name, email, age, studentCode, gpa, ban, createdAt, updatedAt FROM students;
    ''');

    final students = <Student>[];

    for (final row in resultSet) {
      students.add(
        Student(
          row['id'] as int,
          row['name'] as String,
          row['email'] as String,
          (row['age'] as int?) ?? 0,
          row['studentCode'] as String,
          (row['gpa'] as num).toDouble(),
          row['ban'] as String,
          DateTime.parse(row['createdAt'] as String),
          DateTime.parse(row['updatedAt'] as String),
        ),
      );
    }

    return students;
  }

  @override
  Future<Student?> getStudentById(int id) async {
    final resultSet = _dbConnection.database.select(
      '''
      SELECT id, name, email, age, studentCode, gpa, ban, createdAt, updatedAt FROM students WHERE id = ?;
      ''',
      [id],
    );

    if (resultSet.isEmpty) {
      return null;
    }

    final row = resultSet.first;

    return Student(
      row['id'] as int,
      row['name'] as String,
      row['email'] as String,
      (row['age'] as int?) ?? 0,
      row['studentCode'] as String,
      (row['gpa'] as num).toDouble(),
      row['ban'] as String,
      DateTime.parse(row['createdAt'] as String),
      DateTime.parse(row['updatedAt'] as String),
    );
  }

  @override
  Future<void> updateStudent(Student student, int id) async {
    _dbConnection.database.execute(
      '''
      UPDATE students
      SET name = ?, email = ?, age = ?, studentCode = ?, gpa = ?, ban = ?, updatedAt = ?
      WHERE id = ?;
      ''',
      [
        student.name,
        student.email,
        student.age,
        student.studentCode,
        student.gpa,
        student.ban,
        student.updatedAt.toIso8601String(),
        id,
      ],
    );
  }
}