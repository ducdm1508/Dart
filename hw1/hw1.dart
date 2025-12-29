import 'dart:io';

void main() {
  int choice = 0;

  while (choice != 5) {
    print("1. +");
    print("2. -");
    print("3. x");
    print("4. /");
    print("5. Thoat");
    stdout.write("Chon phep tinh: ");

    String? input = stdin.readLineSync();

    if (input == null) {
      print("Nhap khong hop le!");
      continue;
    }

    choice = int.parse(input);
    if (choice >= 1 && choice <= 4) {
      stdout.write("nhap so thu nhat: ");
      double a = double.parse(stdin.readLineSync()!);

      stdout.write("nhap so thu nhat: ");
      double b = double.parse(stdin.readLineSync()!);
      switch (choice) {
        case 1:
          print("${a} + ${b} = ${a + b}");
          break;
        case 2:
          print("${a} +- ${b} = ${a - b}");
          break;

        case 3:
          print("${a} x ${b} = ${a * b}");
          break;

        case 4:
          if (b == 0) {
            print("b phai khac 0");
          } else {
            print("${a} / ${b} = ${a / b}");
          }

          break;
      }
    } else if (choice == 5) {
      print("da thoat chuong trinh");
    } else {
      print("luaj chon khoong hop le");
    }
  }
}
