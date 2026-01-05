import 'dart:io';
import 'model/student.dart';
import 'config/db.dart';
import 'controller/StudentController.dart';

void main() {
  DBConfig().init('student.db'); 

  final controller = StudentController();

  while (true) {
    print("\n===== STUDENT MANAGEMENT =====");
    print("1. Add student");
    print("2. Get student by ID");
    print("3. Update student");
    print("4. Delete student");
    print("5. Display all students");
    print("0. Exit");
    stdout.write("Choose: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write("ID: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Age: ");
        int age = int.parse(stdin.readLineSync()!);
        stdout.write("Student Code: ");
        String code = stdin.readLineSync()!;
        stdout.write("GPA: ");
        double gpa = double.parse(stdin.readLineSync()!);

        controller.add(Student(id, name, age, code, gpa));
        break;

      case 2:
        stdout.write("Enter ID: ");
        int id = int.parse(stdin.readLineSync()!);
        controller.getById(id);
        break;

      case 3:
        stdout.write("ID to update: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("New name: ");
        String name = stdin.readLineSync()!;
        stdout.write("New age: ");
        int age = int.parse(stdin.readLineSync()!);
        stdout.write("New student code: ");
        String code = stdin.readLineSync()!;
        stdout.write("New GPA: ");
        double gpa = double.parse(stdin.readLineSync()!);

        controller.update(id, Student(id, name, age, code, gpa));
        break;

      case 4:
        stdout.write("ID to delete: ");
        int id = int.parse(stdin.readLineSync()!);
        controller.delete(id);
        break;

      case 5:
        controller.displayStudents();
        break;

      case 0:
        DBConfig().close();
        return;

      default:
        print("Invalid choice");
    }
  }
}
