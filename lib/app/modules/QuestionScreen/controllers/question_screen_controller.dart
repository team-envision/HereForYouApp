import 'package:get/get.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../states/question_state.dart';

class QuestionController extends GetxController {
  QuestionState state;
  Logger logger = Logger();

  QuestionController({required this.state});


  @override
  void onInit() {
    super.onInit();
    state.questions = Get.arguments['questions'];
    state.options.value = Get.arguments['options'];
    state.nextId = Get.arguments['nextId'];
  }

  void selectOption(int index) {
    state.selected.value == index
        ? state.selected.value = -1
        : state.selected.value = index;
  }

  void next() {
    if (state.selected.value == -1) {
      Snackbars.info(title: "Oops!", message: "Please select an option");
      return;
    }
    if (state.questionNo < state.questions.length - 1) {
      state.questionNo.value++;
    } else if (state.nextId != "") {
      Get.offNamed(
        Routes.QUESTION_COUNT_DOWN,
        arguments: {'questionnaire': state.nextId},
      );
    } else {
      Get.offAllNamed(Routes.MENTAL_SCORE);
    }
  }
}
