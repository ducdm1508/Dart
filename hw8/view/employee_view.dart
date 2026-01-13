import 'dart:io';

import '../controllers/employee_controller.dart';
import '../models/employee.dart';

class EmployeeView {
  final EmployeeController controller;

  EmployeeView(this.controller);

  void inputEmployees() {
    stdout.write("Name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Base Salary: ");
    double baseSalary = double.parse(stdin.readLineSync()!);

    stdout.write("Working Days: ");
    int workingDays = int.parse(stdin.readLineSync()!);
    int id = controller.employees.length + 1;
    controller.addEmployee(
      Employee(
        id: id,
        name: name,
        baseSalary: baseSalary,
        workingDays: workingDays,
      ),
    );
  }

  void displayEmployees() {
    print("\nEmployee list sorted by salary (descending):");
    for (var emp in controller.employees) {
      print(
        "id: ${emp.id}, "
        "Name: ${emp.name}, "
        "Base Salary: ${emp.baseSalary}, "
        "Working Days: ${emp.workingDays}, "
        "Total Salary: ${emp.calculateSalary()}",
      );
    }
  }
}
