import 'package:get/get.dart';

import '../controllers/gender_page_controller.dart';

class GenderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenderPageController>(
      () => GenderPageController(),
    );
  }
}
