import 'dart:io';

class StudentView {
  String inputString(String label) {
    stdout.write(label);
    return stdin.readLineSync()!;
  }

  double inputDouble(String label) {
    stdout.write(label);
    return double.parse(stdin.readLineSync()!);
  }

  List<double> inputOtherFees() {
    stdout.write('Số khoản phí khác: ');
    int n = int.parse(stdin.readLineSync()!);

    List<double> fees = [];
    for (int i = 0; i < n; i++) {
      stdout.write('Phí ${i + 1}: ');
      fees.add(double.parse(stdin.readLineSync()!));
    }
    return fees;
  }

  void showInvalid() {
    print('❌ Invalid Input');
  }

  void showMessage(String message) {
    print(message);
  }
}
