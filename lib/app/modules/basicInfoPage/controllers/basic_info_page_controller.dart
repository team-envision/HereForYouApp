import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/basicInfoPage/states/basic_info_page_state.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

class BasicInfoPageController extends GetxController {
  final BasicInfoPageState state;

  BasicInfoPageController({required this.state});

  void handleNext() {
    if (state.formKey.currentState?.validate() ?? false) {
      Get.offAllNamed(Routes.MAIN);
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
