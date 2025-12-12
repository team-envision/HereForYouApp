import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/basicInfoPage/data/basic_info_page_data_source.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';

import '../states/basic_info_page_state.dart';

class BasicInfoPageController extends GetxController {
  final BasicInfoPageState state;
  final BasicInfoPageDataSource dataSource;

  BasicInfoPageController({required this.state, required this.dataSource});

  Future<void> handleNext() async {
    if (state.isLoading.value) {
      Snackbars.info(
        title: "Please wait...",
        message: "We are updating your basic details",
      );
    } else {
      if (state.formKey.currentState?.validate() ?? false) {
        state.isLoading.value = true;
        String age = state.ageController.text;
        String height = state.heightController.text;
        String weight = state.weightController.text;
        final result = await dataSource.update(
          age: age,
          height: height,
          weight: weight,
        );
        result.fold(
          (error) {
            Snackbars.error(title: "Error", message: error.message);
            state.isLoading.value = false;
          },
          (value) {
            Get.offAllNamed(Routes.MAIN);
            state.isLoading.value = false;
          },
        );
      }
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
