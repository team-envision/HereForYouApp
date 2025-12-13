import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/states/question_state.dart';

import '../controllers/DASS21_question_screen_controller.dart';
import '../controllers/question_screen_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DASS21QuestionController>(() => DASS21QuestionController());
    Get.lazyPut<QuestionController>(
      () => QuestionController(state: QuestionState()),
    );
  }
}
