import 'package:get/get.dart';

import '../controllers/question_count_down_controller.dart';

class QuestionCountDownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionCountDownController>(
      () => QuestionCountDownController(),
    );
  }
}
