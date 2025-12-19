import 'package:get/get.dart';

import '../../../../../common/firebase/firebase_firestore.dart';
import '../../data/emergency_contact_data_sources.dart';
import '../controllers/emergency_contact_controller.dart';
import '../states/emergency_contact_state.dart';

class EmergencyContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyContactController>(
      () => EmergencyContactController(
        state: EmergencyContactState(),
        dataSources: EmergencyContactDataSources(
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
      ),
    );
  }
}
