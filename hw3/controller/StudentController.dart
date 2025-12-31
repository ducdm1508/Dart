import '../Interface/IStudent.dart';
import '../model/student.dart';

class Studentcontroller implements IStudent {
  List<Student> students = [];
  Studentcontroller(this.students);

  void add(Student st) {
    students.add(st);
  }

  void getById(int id) {
    for (var st in students) {
      if (st.id == id) {
        print("id: ${st.id}");
        print("name: ${st.name}");
        print("age: ${st.age}");
        print("gpa: ${st.gpa}");
        print("studentCode: ${st.studentCode}");
      }
    }
  }

  void update(int id, Student student) {
    for (var st in students) {
      if (st.id == id) {
        st.name = student.name;
        st.age = student.age;
        st.gpa = student.gpa;
        st.studentCode = student.studentCode;
        return;
      }
    }
    print("Not found");
  }

  void delete(int id) {
    bool exists = students.any((st) => st.id == id);

    if (!exists) {
      print("not fount");
      return;
    }
    students.removeWhere((st) => st.id == id);
  }

  void displayStudents() {
    for (var st in students) {
      print("id: ${st.id}");
      print("name: ${st.name}");
      print("age: ${st.age}");
      print("gpa: ${st.gpa}");
      print("studentCode: ${st.studentCode}");
    }
  }
}
