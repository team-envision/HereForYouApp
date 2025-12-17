import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/mentalScore/states/mental_score_state.dart';

import '../controllers/mental_score_controller.dart';

class MentalScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentalScoreController>(
      () => MentalScoreController(state: MentalScoreState()),
    );
  }
}
