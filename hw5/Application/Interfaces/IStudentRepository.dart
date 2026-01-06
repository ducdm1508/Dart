import '../../Domain/Entities/student.dart';

interface class IStudentRepository {
  Future<List<Student>> getAllStudents() => throw UnimplementedError();
  Future<Student?> getStudentById(int id) => throw UnimplementedError();
  Future<void> addStudent(Student student) => throw UnimplementedError();
  Future<void> updateStudent(Student student, int id) => throw UnimplementedError();
  Future<void> deleteStudent(int id) => throw UnimplementedError();

}
