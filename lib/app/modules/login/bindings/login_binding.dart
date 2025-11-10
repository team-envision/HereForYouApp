import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/login/states/login_state.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(state: LoginState()));
  }
}
