import 'package:get/get.dart';
import '../states/change_password_state.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordState state;

  ChangePasswordController({required this.state});

  //TODO: Implement NewPasswordController

  void handleClick() {}

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
