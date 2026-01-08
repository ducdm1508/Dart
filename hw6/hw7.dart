class Student {
  int id;
  String fname;
  String lname;
  DateTime birthday;
  String phone;
  String email;

  Student({
    required this.id,
    required this.fname,
    required this.lname,
    required this.birthday,
    required this.phone,
    required this.email,
  });

  @override
  String toString() {
    return 'Student{id: $id, name: $fname $lname, birthday: $birthday, phone: $phone, email: $email}';
  }
}

Future<Student> getInformation(int id) {
  var student = Future.delayed(Duration(seconds: 3), () {
    if (id == 1) {
      return Student(
        id: 1,
        fname: 'Nguyen',
        lname: 'An',
        birthday: DateTime(2002, 5, 10),
        phone: '0901234567',
        email: 'an.nguyen@email.com',
      );
    } else if (id == 2) {
      return Student(
        id: 2,
        fname: 'Tran',
        lname: 'Binh',
        birthday: DateTime(2001, 8, 20),
        phone: '0912345678',
        email: 'binh.tran@email.com',
      );
    } else {
      throw Exception('Student not found');
    }
  });
  return student;
}

void main() {
  List<int> studentIds = [1, 2, 3, 4];

  for (int id in studentIds) {
    getInformation(id)
        .then((student) {
          print('Student Information: $student');
        })
        .catchError((error) {
          print('Error: $error');
        });
  }
}
