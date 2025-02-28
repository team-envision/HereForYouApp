import 'package:get/get.dart';

import '../controllers/sleep_diary_controller.dart';

class SleepDiaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepDiaryController>(
      () => SleepDiaryController(),
    );
  }
}
