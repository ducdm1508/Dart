
import 'controllers/student_controller.dart';
import 'views/student_view.dart';

void main() {
  final view = StudentView();
  final controller = StudentController(view);
  controller.run();
}
