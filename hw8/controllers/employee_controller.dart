import '../models/employee.dart';

class EmployeeController {
  List<Employee> employees = [];
  void addEmployee(Employee employee) {
    employees.add(employee);
  }

  void sortBySalaryDesc() {
    employees.sort(
      (a, b) => b.calculateSalary().compareTo(a.calculateSalary()),
    );
  }
}
