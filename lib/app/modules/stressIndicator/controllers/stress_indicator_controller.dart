import 'package:get/get.dart';
import 'package:here_for_you_app/common/models/results.dart';

import '../../../../common/services/result_service.dart';

class StressIndicatorController extends GetxController {
  RxList<DailyScore> results = ResultService.to.results;

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
