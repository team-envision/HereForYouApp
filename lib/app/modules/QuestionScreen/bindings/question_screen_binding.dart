import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/states/question_state.dart';

import '../controllers/question_screen_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(
      () => QuestionController(state: QuestionState()),
    );
  }
}
