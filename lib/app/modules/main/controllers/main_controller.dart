import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class MainController extends GetxController {
  final pages = [Routes.HOME, Routes.PROFILE_PAGE];
  var currentIndex = 0.obs;
  final count = 0.obs;

  void changePage(int index) {
    // Special handling for Mind Test - navigate outside the nested navigation
    if (index == 1) {
      Get.toNamed(Routes.MIND_TEST); // Navigate to Mind Test outside nested navigator
      return;
    }

    // For Home (index 0) and Profile (index 2)
    if (index == 0) {
      currentIndex.value = 0;
      Get.offAllNamed(Routes.HOME, id: 1);
    } else if (index == 2) {
      currentIndex.value = 2;
      Get.offAllNamed(Routes.PROFILE_PAGE, id: 1);
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

  void increment() => count.value++;
}