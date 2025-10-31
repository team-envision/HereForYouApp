import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/signup/states/signup_state.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(state: SignUpState()),
    );
  }
}
