import 'package:get/get.dart';

import '../controllers/password_view_controller.dart';

class PasswordViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordViewController>(
      () => PasswordViewController(),
    );
  }
}
