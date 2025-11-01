import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class MainController extends GetxController {
  //TODO: Implement MainController

  final pages = [Routes.HOME, Routes.MIND_TEST, Routes.PROFILE_PAGE];
  var currentIndex = 0.obs;
  final count = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    Get.offAllNamed(pages[index], id: 1);
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
