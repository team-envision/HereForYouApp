import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/stressLevel/states/stress_level_state.dart';
import 'package:here_for_you_app/common/models/results.dart';

import '../../../../common/services/result_service.dart';

class StressLevelController extends GetxController {
  //TODO: Implement StressLevelController
  final StressLevelState state;
  Rx<ResultsModel> resultModel = ResultService.to.resultsModel;


  StressLevelController({required this.state});

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
