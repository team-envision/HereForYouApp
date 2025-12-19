import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/QuestionCountDown/data/question_count_down_data_sources.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../controllers/question_count_down_controller.dart';
import '../states/question_count_down_state.dart';

class QuestionCountDownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionCountDownController>(
      () => QuestionCountDownController(
        state: QuestionCountDownState(),
        dataSources: QuestionCountDownDataSources(
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
      ),
    );
  }
}
