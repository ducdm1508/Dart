
import '../models/student.dart';
import '../views/student_view.dart';

class StudentController {
  final StudentView view;

  StudentController(this.view);

  void run() {
    try {
      final name = view.inputString('Nhập tên: ');
      final tuition = view.inputDouble('Nhập học phí: ');
      final scholarship = view.inputDouble('Nhập học bổng: ');
      final otherFees = view.inputOtherFees();
      final monthlyLiving =
          view.inputDouble('Chi phí sinh hoạt hàng tháng: ');

      final student = Student(
        name: name,
        tuitionFee: tuition,
        scholarship: scholarship,
        otherFees: otherFees,
      );

      if (!student.isValid()) {
        view.showInvalid();
        return;
      }

      final compressed = student.serializeAndCompress();
      final restored = Student.decompressAndDeserialize(compressed);

      view.showMessage('\n✔ Student restored: $restored');
      view.showMessage(
          '✔ Education Tax: ${restored.educationTax.toStringAsFixed(2)}');
      view.showMessage(
          '✔ Annual Cost: ${restored.projectedAnnualCost(monthlyLiving).toStringAsFixed(2)}');
    } catch (e) {
      view.showInvalid();
    }
  }
}
