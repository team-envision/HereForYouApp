import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/signup/states/signup_state.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final SignUpState state;

  SignupController({required this.state});

  void handleSignUp() {
    if (state.formKey.currentState?.validate() ?? false) {
      Get.offAllNamed(Routes.FACE_LOADING);
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
