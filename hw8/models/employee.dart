class Employee {
  int id;
  String name;
  double baseSalary;
  int workingDays;

  Employee({
    required this.id,
    required this.name,
    required this.baseSalary,
    required this.workingDays,
  });

  double calculateSalary() {
    return baseSalary * workingDays;
  }

  void addWorkingDays(int days) {
    if (days > 0) {
      workingDays += days;
    } else {
      print("Invalid number of days");
    }
  }
}
