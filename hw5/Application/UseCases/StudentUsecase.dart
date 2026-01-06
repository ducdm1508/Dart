import '../../Domain/Entities/student.dart';
import '../DTOs/StudentDTO.dart';
import '../Interfaces/IStudentRepository.dart';

class StudentUseCase {
  final IStudentRepository repo;

  StudentUseCase(this.repo);

  Future<List<StudentDTO>> fetchAllStudents() async {
    final students = await repo.getAllStudents();
    return students.map(_toDTO).toList();
  }

  Future<StudentDTO?> fetchStudentById(int id) async {
    final student = await repo.getStudentById(id);
    return student == null ? null : _toDTO(student);
  }

  Future<void> addStudent(StudentDTO dto) {
    final now = DateTime.now();

    final student = Student(
      0,
      dto.name,
      dto.email,
      dto.age,
      dto.studentCode,
      dto.gpa,
      dto.ban,
      now,
      now,
    );

    return repo.addStudent(student);
  }

  Future<void> updateStudent(StudentDTO dto, int id) async {
    final old = await repo.getStudentById(id);
    if (old == null) {
      print('khong tim thay sinh vien de update');
      return;
    }

    final updated = Student(
      id,
      dto.name,
      dto.email,
      dto.age,
      dto.studentCode,
      dto.gpa,
      dto.ban,
      old.createdAt,
      DateTime.now(),
    );

    await repo.updateStudent(updated, id);
  }

  Future<void> deleteStudent(int id) {
    return repo.deleteStudent(id);
  }

  StudentDTO _toDTO(Student student) {
    return StudentDTO(
      student.name,
      student.email,
      student.age,
      student.ban,
      student.studentCode,
      student.gpa,
    );
  }
}
