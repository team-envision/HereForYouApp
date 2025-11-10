import 'package:get/get.dart';

import '../controllers/stress_indicator_controller.dart';

class StressIndicatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StressIndicatorController>(
      () => StressIndicatorController(),
    );
  }
}
