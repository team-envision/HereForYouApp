import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/genderPage/states/gender_page_state.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

class GenderPageController extends GetxController {
  final GenderPageState state;

  GenderPageController({required this.state});

  void handleNext() {
    state.selected.value == ""
        ? Get.snackbar("Oops", "Please select your gender")
        : Get.toNamed(Routes.BASIC_INFO_PAGE);
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
