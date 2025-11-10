import 'package:get/get.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  bool isLoggedIn = false;

  Future<void> check()
  async {
    await Future.delayed(const Duration(seconds: 1));
    if(isLoggedIn)
      Get.offAllNamed(Routes.MAIN);
    else
      Get.offAllNamed(Routes.GET_STARTED);
  }

  @override
  void onInit() {
    super.onInit();
    check();
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
