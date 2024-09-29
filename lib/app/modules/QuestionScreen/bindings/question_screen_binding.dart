import 'package:get/get.dart';
import '../controllers/DASS21_question_screen_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DASS21QuestionController>(() => DASS21QuestionController());
  }
}
