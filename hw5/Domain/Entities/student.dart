import 'person.dart';

class Student extends Person {
  String ban;
  String studentCode;
  double gpa;
  DateTime createdAt;
  DateTime updatedAt;

  Student(int id, String name, String email, int age, this.studentCode, this.gpa, this.ban, this.createdAt, this.updatedAt)
    : super(id, name, email, age);
}
