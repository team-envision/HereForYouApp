import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';
import '../states/change_password_state.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(
        state: Get.put(ChangePasswordState()),
      ),
    );
  }
}
