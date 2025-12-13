import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/emergency_count_down/data/emergency_count_down_data_sources.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../controllers/emergency_count_down_controller.dart';

class EmergencyCountDownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyCountDownController>(
      () => EmergencyCountDownController(
        dataSources: EmergencyCountDownDataSources(
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
      ),
    );
  }
}
