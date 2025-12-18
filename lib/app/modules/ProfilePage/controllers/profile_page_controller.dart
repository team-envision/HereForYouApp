import 'package:get/get.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/models/user.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';

import '../../../../common/services/user_service.dart';

class ProfilePageController extends GetxController {
  UserModel get user => UserService.to.userModel.value;

  Future<void> logout() async {
    try {
      await FirebaseAuthService().logout();
      Get.offAllNamed(Routes.GET_STARTED);
      UserService.to.clear();
    } catch (e) {
      Snackbars.error(title: "Error", message: e.toString());
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
