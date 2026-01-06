import '../../Domain/Entities/course.dart';
import '../DTOs/CourseDTO.dart';
import '../../Infrastructure/Persistence/SqlLite/Repositories/CourseRepository.dart';
import '../Interfaces/ICourseRepository.dart';

class CourseUseCase {
  final ICourseRepository _courseRepository;

  CourseUseCase(this._courseRepository);

  Future<List<Course>> fetchAllCourses() async {
    return await _courseRepository.getAll();
  }
  Future<Course?> fetchCourseById(int id) async {
    return await _courseRepository.getById(id);
  }

  Future<List<Course>> fetchStudentCourses(int studentId) async {
    return await _courseRepository.getStudentCourses(studentId);
  }

  
  Future<void> addCourse(CourseDTO dto) async {
    final now = DateTime.now();
    final course = Course(
      id: 0, 
      name: dto.name,
      description: dto.description,
      createdAt: now,
      updatedAt: now,
    );
    await _courseRepository.add(course);
  }

  Future<void> registerStudent(int studentId, int courseId) async {
    await _courseRepository.registerStudent(studentId, courseId);
  }
}
