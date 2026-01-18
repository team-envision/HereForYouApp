import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/mentalScore/data/mental_score_data_sources.dart';
import 'package:here_for_you_app/common/models/results.dart';
import 'package:here_for_you_app/common/services/result_service.dart';

import '../../../../../common/utils/snackbars.dart';
import '../states/mental_score_state.dart';

class MentalScoreController extends GetxController {
  final MentalScoreState state;
  final MentalScoreDataSources dataSources;

  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  var sheetExtent = 0.43.obs;
  Rx<ResultsModel> resultsModel = ResultService.to.resultsModel;

  MentalScoreController({required this.state, required this.dataSources});

  @override
  void onInit() {
    super.onInit();
    state.isDataLoading.value = true;
    state.key = Get.arguments?['key'];
    initialize();
  }

  void initialize() {
    if (state.key != null) {
      getData();
    } else {
      state.isDataLoading.value = false;
    }
  }

  Future<void> getData() async {
    final result = await dataSources.getLocalData(key: state.key!);
    result.fold(
      (error) {
        Snackbars.error(
          title: "Showing previous results",
          message: error.message,
        );
        state.isDataLoading.value = false;
      },
      (data) {
        Snackbars.info(title: "loaded", message: "answers loaded");
        analyse(userAnswers: data);
      },
    );
  }

  Future<void> analyse({required Map<String, String> userAnswers}) async {
    final result = await dataSources.analyzeUserState(userAnswers: userAnswers);
    result.fold(
      (error) {
        Snackbars.error(
          title: "Showing previous results",
          message: error.message,
        );
      },
      (data) async {
        Snackbars.info(title: "api res", message: data.mentalTip);
        DailyScore score = DailyScore(
          mentalScore: data.mentalScore,
          moodScore: data.moodQuality,
          stressScore: data.stressLevel,
        );
        await ResultService.to.setToday(
          dailyScore: score,
          mentalRecommendation: data.mentalTip,
          stressRecommendation: data.stressTip,
        );
      },
    );
    state.isDataLoading.value = false;
  }

  void updateExtent(double extent) {
    sheetExtent.value = extent;
  }
}
