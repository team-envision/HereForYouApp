import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/QuestionCountDown/data/question_count_down_data_sources.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:logger/logger.dart';

import '../states/question_count_down_state.dart';

class QuestionCountDownController extends GetxController {
  QuestionCountDownState state;
  QuestionCountDownDataSources dataSources;
  Logger logger = Logger();

  QuestionCountDownController({required this.state, required this.dataSources});

  Future<void> getData() async {
    final result = await dataSources.getQuestionnaire(
      questionnaire: state.questionnaire,
    );
    result.fold(
      (error) {
        Snackbars.error(title: "Unable to load data", message: error.message);
        Get.back();
      },
      (questionnaire) async {
        state.progressLabel.value = questionnaire.progressLabel;
        state.description.value = questionnaire.description;
        state.note.value = questionnaire.note;
        state.questions = questionnaire.questions;
        state.options = questionnaire.options;
        state.nextId = questionnaire.nextId;
        await Future.delayed(const Duration(seconds: 1));
        state.isLoading.value = false;
      },
    );
  }

  void start() {
    Get.offNamed(
      Routes.QUESTION_SCREEN,
      arguments: {
        'questions': state.questions,
        'options': state.options,
        'nextId': state.nextId,
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    state.questionnaire = Get.arguments?['questionnaire'] ?? "DASS_21";
    logger.d(state.questionnaire);
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
