import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/stressLevel/states/stress_level_state.dart';

import '../controllers/stress_level_controller.dart';

class StressLevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StressLevelController>(
      () => StressLevelController(state: StressLevelState()),
    );
  }
}
