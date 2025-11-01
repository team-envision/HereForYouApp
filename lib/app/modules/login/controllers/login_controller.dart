import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/login/states/login_state.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginState state;

  LoginController({required this.state});

  void handleSignIn() {
    if (state.formKey.currentState?.validate() ?? false) {
      Get.offAllNamed(Routes.MAIN);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
