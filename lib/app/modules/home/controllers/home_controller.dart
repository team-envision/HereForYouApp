import 'package:get/get.dart';
import 'package:here_for_you_app/common/models/user.dart';

import '../../../../common/services/user_service.dart';

class HomeController extends GetxController {
  final emojis = ["🙁", "😐", "🙂", "😃", "😆"];
  final selectedIndex = 0.obs;

  UserModel get user => UserService.to.userModel.value;

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
