import '../../Application/DTOs/CourseDTO.dart';
import '../../Application/UseCases/CourseUseCase.dart';
import '../../Domain/Entities/course.dart';

class CourseController {
  final CourseUseCase _courseUseCase;

  CourseController(this._courseUseCase);

  Future<List<Course>> getAllCourses() async {
    return await _courseUseCase.fetchAllCourses();
  }

  Future<Course?> getCourseById(int id) async {
    return await _courseUseCase.fetchCourseById(id);
  }

  Future<List<Course>> getStudentCourses(int studentId) async {
    return await _courseUseCase.fetchStudentCourses(studentId);
  }

  Future<void> createCourse(String name, String description) async {
    final dto = CourseDTO(name: name, description: description);
    await _courseUseCase.addCourse(dto);
  }

  Future<void> enrollStudent(int studentId, int courseId) async {
    await _courseUseCase.registerStudent(studentId, courseId);
  }
}
