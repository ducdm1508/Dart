import '../../../../Application/Interfaces/ICourseRepository.dart';
import '../../../../Domain/Entities/course.dart';
import '../db_connect.dart';

class CourseRepository implements ICourseRepository {
  final DbConnection _dbConnection = DbConnection();

  @override
  Future<void> add(Course course) async {
    try {
      _dbConnection.database.execute(
        '''
        INSERT INTO courses (name, description, createdAt, updatedAt)
        VALUES (?, ?, ?, ?);
        ''',
        [
          course.name,
          course.description,
          course.createdAt.toIso8601String(),
          course.updatedAt.toIso8601String(),
        ],
      );
    } catch (e) {
      print('Error adding course: $e');
      rethrow;
    }
  }

  @override
  Future<List<Course>> getAll() async {
    try {
      final resultSet = _dbConnection.database.select('''
        SELECT id, name, description, createdAt, updatedAt FROM courses;
      ''');

      final courses = <Course>[];
      for (final row in resultSet) {
        courses.add(
          Course(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            createdAt: DateTime.parse(row['createdAt'] as String),
            updatedAt: DateTime.parse(row['updatedAt'] as String),
          ),
        );
      }
      return courses;
    } catch (e) {
      print('Error fetching courses: $e');
      return [];
    }
  }

  @override
  Future<Course?> getById(int id) async {
    try {
      final resultSet = _dbConnection.database.select(
        '''
        SELECT id, name, description, createdAt, updatedAt
        FROM courses
        WHERE id = ?;
        ''',
        [id],
      );

      if (resultSet.isEmpty) return null;

      final row = resultSet.first;
      return Course(
        id: row['id'] as int,
        name: row['name'] as String,
        description: row['description'] as String,
        createdAt: DateTime.parse(row['createdAt'] as String),
        updatedAt: DateTime.parse(row['updatedAt'] as String),
      );
    } catch (e) {
      print('Error fetching course by id: $e');
      return null;
    }
  }

  @override
  Future<List<Course>> getStudentCourses(int studentId) async {
    try {
      final resultSet = _dbConnection.database.select(
        '''
        SELECT c.id, c.name, c.description, c.createdAt, c.updatedAt
        FROM courses c
        INNER JOIN course_registrations cr ON cr.course_id = c.id
        WHERE cr.student_id = ?;
        ''',
        [studentId],
      );

      final courses = <Course>[];
      for (final row in resultSet) {
        courses.add(
          Course(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            createdAt: DateTime.parse(row['createdAt'] as String),
            updatedAt: DateTime.parse(row['updatedAt'] as String),
          ),
        );
      }
      return courses;
    } catch (e) {
      print('Error fetching student courses: $e');
      return [];
    }
  }

  @override
  Future<void> registerStudent(int studentId, int courseId) async {
    try {
      _dbConnection.database.execute(
        '''
        INSERT INTO course_registrations (student_id, course_id)
        VALUES (?, ?);
        ''',
        [studentId, courseId],
      );
    } catch (e) {
      print('Error registering student: $e');
      rethrow;
    }
  }
}
