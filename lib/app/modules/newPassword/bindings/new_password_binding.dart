import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/newPassword/states/new_password_state.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPasswordController>(
      () => NewPasswordController(
        state: Get.put(NewPasswordState()),
      ),
    );
  }
}
