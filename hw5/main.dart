import 'dart:io';

import 'Application/DTOs/StudentDTO.dart';
import 'Application/UseCases/StudentUsecase.dart';
import 'Infrastructure/Factory/RepositoryFactory.dart';
import 'Presentation/Controllers/StudentController.dart';

void main() async {
  final repo = RepositoryFactory.createStudentRepository();
  final useCase = StudentUseCase(repo);
  StudentController controller = StudentController(useCase);

  bool running = true;

  while (running) {
    print('\n===== STUDENT CRUD =====');
    print('1. show all');
    print('2. find by id');
    print('3. add');
    print('4. update');
    print('5. delete');
    print('0. exit');
    stdout.write('choose: ');

    try {
      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          final list = await controller
              .getAllStudents(); // trả về List<Student> thay vì DTO
          if (list.isEmpty) {
            print('empty');
          } else {
            for (var s in list) {
              print(
                'id=${s.id}, name=${s.name}, email=${s.email}, age=${s.age}, code=${s.studentCode}, gpa=${s.gpa}, ban=${s.ban}, createdAt=${s.createdAt}, updatedAt=${s.updatedAt}',
              );
            }
          }

          break;

        case 2:
          stdout.write('id: ');
          int id = int.parse(stdin.readLineSync()!);

          final s = await controller.getStudentById(id);
          if (s == null) {
            print('Student not found');
          } else {
            print(
              'name=${s.name}, email=${s.email}, age=${s.age}, code=${s.studentCode}, gpa=${s.gpa}',
            );
          }
          break;

        case 3:
          stdout.write('name: ');
          String name = stdin.readLineSync()!;

          stdout.write('email: ');
          String email = stdin.readLineSync()!;

          stdout.write('age: ');
          int age = int.parse(stdin.readLineSync()!);

          stdout.write('student code: ');
          String code = stdin.readLineSync()!;

          stdout.write('gpa: ');
          double gpa = double.parse(stdin.readLineSync()!);

          String ban = 'unbanned';

          final dto = StudentDTO(name, email, age, ban, code, gpa);
          await controller.addStudent(dto);

          print('Added successfully!');
          break;

        case 4:
          stdout.write('id: ');
          int idUpdate = int.parse(stdin.readLineSync()!);

          stdout.write('name: ');
          String nameUpdate = stdin.readLineSync()!;

          stdout.write('email: ');
          String emailUpdate = stdin.readLineSync()!;

          stdout.write('age: ');
          int ageUpdate = int.parse(stdin.readLineSync()!);

          stdout.write('student code: ');
          String codeUpdate = stdin.readLineSync()!;

          stdout.write('gpa: ');
          double gpaUpdate = double.parse(stdin.readLineSync()!);

          String banUpdate = 'unbanned';

          final dtoUpdate = StudentDTO(
            nameUpdate,
            emailUpdate,
            ageUpdate,
            banUpdate,
            codeUpdate,
            gpaUpdate,
          );

          await controller.updateStudent(dtoUpdate, idUpdate);

          print('Updated successfully!');
          break;

        case 5:
          stdout.write('id: ');
          int idDelete = int.parse(stdin.readLineSync()!);

          await controller.deleteStudent(idDelete);
          print('Deleted successfully!');
          break;

        case 0:
          print('Exiting...');
          running = false;
          break;

        default:
          print('Invalid choice');
      }
    } catch (e) {
      print('Invalid input: $e');
    }
  }
}
