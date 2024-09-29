import 'package:get/get.dart';

import '../controllers/mind_anchor_main_screen_controller.dart';

class MindAnchorMainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MindAnchorMainScreenController>(
      () => MindAnchorMainScreenController(),
    );
  }
}
