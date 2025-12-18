import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/mentalScore/data/mental_score_data_sources.dart';
import 'package:here_for_you_app/common/firebase/firebase_ai.dart';
import 'package:here_for_you_app/common/local_storage/class%20LocalStorage.dart';

import '../controllers/mental_score_controller.dart';
import '../states/mental_score_state.dart';

class MentalScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentalScoreController>(
      () => MentalScoreController(
        state: MentalScoreState(),
        dataSources: MentalScoreDataSources(
          localStorage: LocalStorage(),
          firebaseAi: FirebaseAi(),
        ),
      ),
    );
  }
}
