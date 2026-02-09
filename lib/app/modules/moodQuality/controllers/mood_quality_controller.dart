import 'package:get/get.dart';

import '../../../../common/models/results.dart';
import '../../../../common/services/result_service.dart';

class MoodQualityController extends GetxController {
  RxList<DailyScore> results = ResultService.to.results;
  final emojis = ["", "🙁", "😐", "🙂", "😃", "😆"];

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
}
