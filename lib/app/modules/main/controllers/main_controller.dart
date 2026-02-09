import 'package:get/get.dart';
import 'package:here_for_you_app/common/services/result_service.dart';
import 'package:here_for_you_app/common/services/user_service.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';

class MainController extends GetxController {
  final pages = [Routes.HOME, Routes.PROFILE_PAGE];
  var currentIndex = 0.obs;
  final count = 0.obs;
  RxBool isDataLoading = true.obs;
  UserService userService = Get.find<UserService>();
  Logger logger = Logger();

  void changePage(int index) {
    if (index == 1) {
      Get.toNamed(Routes.QUESTION_COUNT_DOWN);
      return;
    }
    if (index == 0) {
      currentIndex.value = 0;
      Get.offAllNamed(Routes.HOME, id: 1);
    } else if (index == 2) {
      currentIndex.value = 2;
      Get.offAllNamed(Routes.PROFILE_PAGE, id: 1);
    }
  }

  Future<void> fetchData() async {
    final userResult = await userService.get(forceRefresh: true);
    userResult.fold((error) {}, (data) async {
      final resultsResult = await ResultService.to.fetchAll(forceRefresh: true);
      resultsResult.fold(
        (error) {
          Snackbars.error(title: "Error", message: "Could not load data");
        },
        (data) async {
          Snackbars.info(title: "Results", message: data.toString());
          await Future.delayed(const Duration(seconds: 1));
          isDataLoading.value = false;
        },
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    isDataLoading.value = true;
    fetchData();
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
