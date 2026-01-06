import 'package:dotenv/dotenv.dart';

import '../../Application/Interfaces/IStudentRepository.dart';
import '../Persistence/SqlLite/Repositories/StudentRepository.dart';
import '../Persistence/SqlLite/db_connect.dart';

final env = DotEnv()..load(['.env']);

class RepositoryFactory {
  static IStudentRepository createStudentRepository() {
    final dbType = env['DATABASE_TYPE'];

    switch (dbType) {
      case 'sqlite':
        DbConnection().init(env['SQLITE_PATH'] ?? 'students.db');
        return StudentRepository();

      // case 'mysql':
      //   return StudentRepositoryMysql();

      default:
        throw Exception('Unsupported database type: $dbType');
    }
  }
}
