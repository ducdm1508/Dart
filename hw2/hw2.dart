import 'dart:io';

class Student {
  int id;
  String name;
  int age;
  int grade;

  Student(this.id, this.name, this.age, this.grade);

  void displayInfo() {
    print('ID: $id, Name: $name, Age: $age, Grade: $grade');
  }

  serializeAndCompress() {}
}

List<Student> students = [];

void addStudent(Student student) {
  students.add(student);
  print('them ok');
}

void displayStudents() {
  if (students.isEmpty) {
    print('khong tim thay sinh vien nao');
    return;
  }
  for (var student in students) {
    student.displayInfo();
  }
}

void updateStudent(int id, Student student) {
  for (var s in students) {
    if (s.id == id) {
      s.name = student.name;
      s.age = student.age;
      s.grade = student.grade;
      print('update ok');
      return;
    }
  }
  print('khong tim thay id');
}

void getById(int id) {
  for (var s in students) {
    if (s.id == id) {
      s.displayInfo();
      return;
    }
  }
  print('khong tim thay id');
}

void deleteStudent(int id) {
  students.removeWhere((s) => s.id == id);
  print('xoa ok');
}

void main() {
  while (true) {
    print('\n===== MENU =====');
    print('1. Them sinh vien');
    print('2. Hien thi danh sach');
    print('3. Cap nhat');
    print('4. Tim theo ID');
    print('5. Xoa sinh vien');
    print('6. Thoat');
    stdout.write('Chon: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Nhap ID: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Nhap Name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Nhap Age: ');
        int age = int.parse(stdin.readLineSync()!);
        stdout.write('Nhap Grade: ');
        int grade = int.parse(stdin.readLineSync()!);

        Student student = Student(id, name, age, grade);
        students.add(student);
        break;

      case '2':
        displayStudents();
        break;

      case '3':
        stdout.write('Nhap ID muon update: ');
        int idUpdate = int.parse(stdin.readLineSync()!);
        stdout.write('Nhap ten moi: ');
        String nameUpdate = stdin.readLineSync()!;
        stdout.write('Nhap tuoi moi: ');
        int ageUpdate = int.parse(stdin.readLineSync()!);
        stdout.write('Nhap diem moi: ');
        int gradeUpdate = int.parse(stdin.readLineSync()!);

        Student updatedStudent = Student(
          idUpdate,
          nameUpdate,
          ageUpdate,
          gradeUpdate,
        );
        updateStudent(idUpdate, updatedStudent);
        break;

      case '4':
        stdout.write('Nhap ID muon tim: ');
        int idFind = int.parse(stdin.readLineSync()!);
        getById(idFind);
        break;

      case '5':
        stdout.write('Nhap ID muon xoa: ');
        int idDelete = int.parse(stdin.readLineSync()!);
        deleteStudent(idDelete);
        break;

      case '6':
        print('Thoat ....');
        return;

      default:
        print(' Lua chon khong hop le.');
    }
  }
}
