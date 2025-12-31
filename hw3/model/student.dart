import 'person.dart';

class Student extends Person {
  String studentCode;
  double gpa;

  Student(int id, String name, int age, this.studentCode, this.gpa)
    : super(id, name, age);
}
