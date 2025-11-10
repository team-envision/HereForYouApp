import 'package:get/get.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

class FaceLoadingController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() async {
    await Future.delayed(const Duration(milliseconds: 700));
    Get.offAllNamed(Routes.GENDER_PAGE);
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