import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/genderPage/states/gender_page_state.dart';

import '../controllers/gender_page_controller.dart';

class GenderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenderPageController>(
      () => GenderPageController(state: GenderPageState()),
    );
  }
}
