import 'package:get/get.dart';
import 'package:here_for_you_app/common/local_storage/class%20LocalStorage.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../states/question_state.dart';

class QuestionController extends GetxController {
  QuestionState state;
  Logger logger = Logger();
  LocalStorage localStorage = LocalStorage();
  Map<String, String> results = {};

  QuestionController({required this.state});

  @override
  void onInit() {
    super.onInit();
    state.questions = Get.arguments['questions'];
    state.options.value = Get.arguments['options'];
    state.nextId = Get.arguments['nextId'];
    state.key = Get.arguments['key'];
  }

  void selectOption(int index) {
    state.selected.value == index
        ? state.selected.value = -1
        : state.selected.value = index;
  }

  Future<void> next() async {
    if (state.selected.value == -1) {
      Snackbars.info(title: "Oops!", message: "Please select an option");
      return;
    }
    if (state.questionNo < state.questions.length - 1) {
      results.addAll({
        state.questions[state.questionNo.value]:
            state.options[state.selected.value].label,
      });
      state.questionNo.value++;
    } else if (state.nextId != "") {
      state.isLoading = true.obs;
      final result = await localStorage.addResults(results, state.key);
      result.fold((error) {}, (result) {
        state.key = result;
        Snackbars.info(title: "saved", message: state.key.toString());
      });

      Get.offNamed(
        Routes.QUESTION_COUNT_DOWN,
        arguments: {'questionnaire': state.nextId, 'key': state.key},
      );
      state.isLoading.value = false;
    } else {
      Get.offAllNamed(Routes.MENTAL_SCORE, arguments: {'key': state.key});
    }
  }
}
