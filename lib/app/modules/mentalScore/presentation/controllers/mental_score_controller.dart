import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/mentalScore/data/mental_score_data_sources.dart';

import '../../../../../common/utils/snackbars.dart';
import '../states/mental_score_state.dart';

class MentalScoreController extends GetxController {
  final MentalScoreState state;
  final MentalScoreDataSources dataSources;

  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  var sheetExtent = 0.43.obs;

  MentalScoreController({required this.state, required this.dataSources});

  @override
  void onInit() {
    super.onInit();
    state.isDataLoading.value = true;
    state.key = Get.arguments?['key'];
    getData();
  }

  Future<void> getData() async {
    if (state.key != null) {
      final result = await dataSources.getLocalData(key: state.key!);
      result.fold(
        (error) {
          state.isDataLoading.value = false;
          Snackbars.error(title: "Error", message: "Could not load your data");
        },
        (data) {
          analyse(userAnswers: data);
        },
      );
    }
  }

  Future<void> analyse({required Map<String, String> userAnswers}) async {
    final result = await dataSources.analyzeUserState(userAnswers: userAnswers);
    result.fold(
      (error) {
        state.isDataLoading.value = false;
        Snackbars.error(title: "Error", message: error.message);
      },
      (data) {
        state.analysis.value = data.mentalTip;
        state.score.value = data.mentalScore;
        state.isDataLoading.value = false;
      },
    );
  }

  void updateExtent(double extent) {
    sheetExtent.value = extent;
  }
}
