import '../../Domain/Entities/course.dart';

abstract class ICourseRepository {
  Future<List<Course>> getAll();
  Future<Course?> getById(int id);
  Future<void> add(Course course);
  Future<void> registerStudent(int studentId, int courseId);
  Future<List<Course>> getStudentCourses(int studentId);
}
