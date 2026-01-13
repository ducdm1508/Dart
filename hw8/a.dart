import 'dart:io';

import 'controllers/employee_controller.dart';
import 'view/employee_view.dart';

void main() {
  EmployeeController controller = EmployeeController();
  final EmployeeView view = EmployeeView(controller);

  int choice;
  do {
    print("\nMenu:");
    print("1. Input Employee Data");
    print("2. Display Employee Data Sorted by Salary");
    print("3. Exit");
    stdout.write("Enter your choice: ");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        view.inputEmployees();
        break;
      case 2:
        controller.sortBySalaryDesc();
        view.displayEmployees();
        break;
      case 3:
        print("Exiting...");
        break;
      default:
        print("Invalid choice. Please try again.");
    }
  } while (choice != 3);
}
