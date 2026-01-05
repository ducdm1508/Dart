import '../../Domain/Entities/student.dart';

interface class IStudentRepository {
  Future<List<Student>> getAllStudents() => throw UnimplementedError();
  Future<Student?> getStudentById(String id) => throw UnimplementedError();
  Future<void> addStudent(Student student) => throw UnimplementedError();
  Future<void> updateStudent(Student student) => throw UnimplementedError();
  Future<void> deleteStudent(String id) => throw UnimplementedError();
}
