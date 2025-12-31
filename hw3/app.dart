import 'dart:io';

import 'controller/StudentController.dart';
import 'model/student.dart';

void main() {
  Studentcontroller controller = Studentcontroller([]);

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
        String studentCode = stdin.readLineSync()!;

        stdout.write("GPA: ");
        double gpa = double.parse(stdin.readLineSync()!);

        Student st = Student(id, name, age, studentCode, gpa);
        controller.add(st);

        print("Add success");
        break;

      case 2:
        stdout.write("Enter ID: ");
        int findId = int.parse(stdin.readLineSync()!);
        controller.getById(findId);
        break;

      case 3:
        stdout.write("ID to update: ");
        int upId = int.parse(stdin.readLineSync()!);

        stdout.write("New name: ");
        String newName = stdin.readLineSync()!;

        stdout.write("New age: ");
        int newAge = int.parse(stdin.readLineSync()!);

        stdout.write("New student code: ");
        String newCode = stdin.readLineSync()!;

        stdout.write("New GPA: ");
        double newGpa = double.parse(stdin.readLineSync()!);

        Student newSt = Student(upId, newName, newAge, newCode, newGpa);
        controller.update(upId, newSt);
        break;

      case 4:
        stdout.write("ID to delete: ");
        int delId = int.parse(stdin.readLineSync()!);
        controller.delete(delId);
        break;

      case 5:
        controller.displayStudents();
        break;

      case 0:
        print("Bye 👋");
        return;

      default:
        print("Invalid choice");
    }
  }
}
