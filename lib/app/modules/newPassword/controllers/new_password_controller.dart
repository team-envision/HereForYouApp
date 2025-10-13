import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/newPassword/states/new_password_state.dart';

class NewPasswordController extends GetxController {
  NewPasswordState state;

  NewPasswordController({required this.state});
  //TODO: Implement NewPasswordController

  void handleClick()
  {

  }

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
