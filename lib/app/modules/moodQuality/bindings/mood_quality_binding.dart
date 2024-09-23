import 'package:get/get.dart';

import '../controllers/mood_quality_controller.dart';

class MoodQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoodQualityController>(
      () => MoodQualityController(),
    );
  }
}
