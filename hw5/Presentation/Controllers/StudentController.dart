import '../../Application/DTOs/StudentDTO.dart';
import '../../Application/UseCases/StudentUsecase.dart';
import '../../Domain/Entities/student.dart';

class StudentController {
  final StudentUseCase _studentUseCase;

  StudentController(this._studentUseCase);

  Future<List<Student>> getAllStudents() async {
    return await _studentUseCase.repo.getAllStudents();
  }

  Future<Student?> getStudentById(int id) async {
    return await _studentUseCase.repo.getStudentById(id);
  }

  Future<void> addStudent(StudentDTO dto) async {
    await _studentUseCase.addStudent(dto);
  }

  Future<void> updateStudent(StudentDTO dto , int id) async {
    await _studentUseCase.updateStudent(dto, id);
  }

  Future<void> deleteStudent(int id) async {
    await _studentUseCase.deleteStudent(id);
  }
}
