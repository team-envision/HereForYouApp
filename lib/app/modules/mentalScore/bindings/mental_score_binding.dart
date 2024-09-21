import 'package:get/get.dart';

import '../controllers/mental_score_controller.dart';

class MentalScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentalScoreController>(
      () => MentalScoreController(),
    );
  }
}
