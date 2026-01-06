import 'package:dotenv/dotenv.dart';

import '../../Application/Interfaces/IStudentRepository.dart';
import '../../Application/Interfaces/ICourseRepository.dart';
import '../Persistence/SqlLite/Repositories/CourseRepository.dart';
import '../Persistence/SqlLite/Repositories/StudentRepository.dart';

final env = DotEnv()..load(['.env']);

class RepositoryFactory {

  static IStudentRepository createStudentRepository() {
    return StudentRepository();
  }

  static ICourseRepository createCourseRepository() {
    return CourseRepository();
  }
}
