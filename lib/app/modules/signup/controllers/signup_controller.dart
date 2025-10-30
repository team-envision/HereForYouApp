import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/signup/states/signup_state.dart';

class SignupController extends GetxController {
  final SignUpState state;

  SignupController({required this.state});

  final count = 0.obs;

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

  void increment() => count.value++;
}
