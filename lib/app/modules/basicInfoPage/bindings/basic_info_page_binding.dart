import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/basicInfoPage/states/basic_info_page_state.dart';

import '../controllers/basic_info_page_controller.dart';

class BasicInfoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicInfoPageController>(
      () => BasicInfoPageController(state: BasicInfoPageState()),
    );
  }
}
