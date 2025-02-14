import 'package:get/get.dart';

import '../controllers/emergency_contact_controller.dart';

class EmergencyContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyContactController>(
          () => EmergencyContactController(),
    );
  }
}
