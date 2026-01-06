import 'dart:io';

import 'Application/DTOs/StudentDTO.dart';
import 'Application/UseCases/StudentUsecase.dart';
import 'Infrastructure/Persistence/SqlLite/db_connect.dart';
import 'Presentation/Controllers/StudentController.dart';

import 'Application/DTOs/CourseDTO.dart';
import 'Application/UseCases/CourseUseCase.dart';
import 'Presentation/Controllers/CourseController.dart';

import 'Infrastructure/Factory/RepositoryFactory.dart';

void main() async {
  DbConnection().init(env['SQLITE_PATH'] ?? 'students.db');
  final studentRepo = RepositoryFactory.createStudentRepository();
  final studentUseCase = StudentUseCase(studentRepo);
  final studentController = StudentController(studentUseCase);

  final courseRepo = RepositoryFactory.createCourseRepository();
  final courseUseCase = CourseUseCase(courseRepo);
  final courseController = CourseController(courseUseCase);

  bool running = true;

  while (running) {
    print('\n===== MAIN MENU =====');
    print('1. Student Management');
    print('2. Course Management');
    print('0. Exit');
    stdout.write('Choose: ');

    try {
      int mainChoice = int.parse(stdin.readLineSync()!);

      switch (mainChoice) {
        case 1:
          await studentMenu(studentController);
          break;

        case 2:
          await courseMenu(courseController);
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

// ---------------- STUDENT MENU ----------------
Future<void> studentMenu(StudentController controller) async {
  bool studentRunning = true;
  while (studentRunning) {
    print('\n===== STUDENT MENU =====');
    print('1. Show all students');
    print('2. Find student by ID');
    print('3. Add student');
    print('4. Update student');
    print('5. Delete student');
    print('0. Back to main menu');
    stdout.write('Choose: ');

    try {
      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          final list = await controller.getAllStudents();
          if (list.isEmpty) {
            print('No students found');
          } else {
            for (var s in list) {
              print(
                  'id=${s.id}, name=${s.name}, email=${s.email}, age=${s.age}, code=${s.studentCode}, gpa=${s.gpa}, ban=${s.ban}, createdAt=${s.createdAt}, updatedAt=${s.updatedAt}');
            }
          }
          break;

        case 2:
          stdout.write('Student ID: ');
          int id = int.parse(stdin.readLineSync()!);
          final s = await controller.getStudentById(id);
          if (s == null) {
            print('Student not found');
          } else {
            print(
                'name=${s.name}, email=${s.email}, age=${s.age}, code=${s.studentCode}, gpa=${s.gpa}');
          }
          break;

        case 3:
          stdout.write('Name: ');
          String name = stdin.readLineSync()!;

          stdout.write('Email: ');
          String email = stdin.readLineSync()!;

          stdout.write('Age: ');
          int age = int.parse(stdin.readLineSync()!);

          stdout.write('Student code: ');
          String code = stdin.readLineSync()!;

          stdout.write('GPA: ');
          double gpa = double.parse(stdin.readLineSync()!);

          String ban = 'unbanned';

          final dto = StudentDTO(name, email, age, ban, code, gpa);
          await controller.addStudent(dto);
          print('Student added successfully!');
          break;

        case 4:
          stdout.write('ID to update: ');
          int idUpdate = int.parse(stdin.readLineSync()!);

          stdout.write('Name: ');
          String nameUpdate = stdin.readLineSync()!;

          stdout.write('Email: ');
          String emailUpdate = stdin.readLineSync()!;

          stdout.write('Age: ');
          int ageUpdate = int.parse(stdin.readLineSync()!);

          stdout.write('Student code: ');
          String codeUpdate = stdin.readLineSync()!;

          stdout.write('GPA: ');
          double gpaUpdate = double.parse(stdin.readLineSync()!);

          String banUpdate = 'unbanned';

          final dtoUpdate =
              StudentDTO(nameUpdate, emailUpdate, ageUpdate, banUpdate, codeUpdate, gpaUpdate);

          await controller.updateStudent(dtoUpdate, idUpdate);
          print('Student updated successfully!');
          break;

        case 5:
          stdout.write('ID to delete: ');
          int idDelete = int.parse(stdin.readLineSync()!);
          await controller.deleteStudent(idDelete);
          print('Student deleted successfully!');
          break;

        case 0:
          studentRunning = false;
          break;

        default:
          print('Invalid choice');
      }
    } catch (e) {
      print('Invalid input: $e');
    }
  }
}

// ---------------- COURSE MENU ----------------
Future<void> courseMenu(CourseController controller) async {
  bool courseRunning = true;
  while (courseRunning) {
    print('\n===== COURSE MENU =====');
    print('1. Show all courses');
    print('2. Find course by ID');
    print('3. Add course');
    print('4. Show courses of student');
    print('5. Register student to course');
    print('0. Back to main menu');
    stdout.write('Choose: ');

    try {
      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          final list = await controller.getAllCourses();
          if (list.isEmpty) {
            print('No courses found');
          } else {
            for (var c in list) {
              print(
                  'id=${c.id}, name=${c.name}, description=${c.description}, createdAt=${c.createdAt}, updatedAt=${c.updatedAt}');
            }
          }
          break;

        case 2:
          stdout.write('Course ID: ');
          int id = int.parse(stdin.readLineSync()!);
          final course = await controller.getCourseById(id);
          if (course == null) {
            print('Course not found');
          } else {
            print(
                'name=${course.name}, description=${course.description}, createdAt=${course.createdAt}, updatedAt=${course.updatedAt}');
          }
          break;

        case 3:
          stdout.write('Course name: ');
          String name = stdin.readLineSync()!;

          stdout.write('Description: ');
          String description = stdin.readLineSync()!;

          await controller.createCourse(name, description);
          print('Course added successfully!');
          break;

        case 4:
          stdout.write('Student ID: ');
          int studentId = int.parse(stdin.readLineSync()!);
          final courses = await controller.getStudentCourses(studentId);
          if (courses.isEmpty) {
            print('No courses registered for this student');
          } else {
            for (var c in courses) {
              print(
                  'id=${c.id}, name=${c.name}, description=${c.description}, createdAt=${c.createdAt}, updatedAt=${c.updatedAt}');
            }
          }
          break;

        case 5:
          stdout.write('Student ID: ');
          int studentId = int.parse(stdin.readLineSync()!);

          stdout.write('Course ID: ');
          int courseId = int.parse(stdin.readLineSync()!);

          await controller.enrollStudent(studentId, courseId);
          print('Student registered to course successfully!');
          break;

        case 0:
          courseRunning = false;
          break;

        default:
          print('Invalid choice');
      }
    } catch (e) {
      print('Invalid input: $e');
    }
  }
}
