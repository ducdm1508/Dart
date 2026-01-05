import '../../../../Application/Interfaces/IStudentRepository.dart';
import '../../../../Domain/Entities/student.dart';

class Studentrepository implements IStudentRepository {
  @override
  Future<void> addStudent(Student student) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteStudent(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> getAllStudents() {
    throw UnimplementedError();
  }

  @override
  Future<Student?> getStudentById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateStudent(Student student) {
    
    throw UnimplementedError();
  }
  
}