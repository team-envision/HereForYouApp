import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/genderPage/data/gender_page_data_source.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

import '../../../../../common/utils/snackbars.dart';
import '../states/gender_page_state.dart';

class GenderPageController extends GetxController {
  final GenderPageDataSource dataSource;
  final GenderPageState state;

  GenderPageController({required this.state, required this.dataSource});

  Future<void> handleNext() async {
    if (state.isLoading.value) {
      Snackbars.info(
        title: "Please wait...",
        message: "We are updating your gender.",
      );
    } else {
      if (state.selected.value != "") {
        state.isLoading.value = true;
        String gender = state.selected.value.split(' ').last;
        final result = await dataSource.updateGender({
          'gender': gender,
          'status': 'basicInfo',
        });
        result.fold(
          (error) {
            Snackbars.error(title: "Error", message: error.message);
            state.isLoading.value = false;
          },
          (value) {
            Get.toNamed(Routes.BASIC_INFO_PAGE);
            state.isLoading.value = false;
          },
        );
      } else {
        Snackbars.info(title: "Oops!", message: "Please select your gender");
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
