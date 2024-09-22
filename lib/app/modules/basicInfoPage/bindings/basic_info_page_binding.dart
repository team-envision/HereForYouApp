import 'package:get/get.dart';

import '../controllers/basic_info_page_controller.dart';

class BasicInfoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicInfoPageController>(
      () => BasicInfoPageController(),
    );
  }
}
