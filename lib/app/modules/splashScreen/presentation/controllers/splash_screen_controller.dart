// ============================================
// SplashScreenController (splash_screen_controller.dart)
// ============================================

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/splashScreen/data/splash_screen_data_source.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:logger/logger.dart';

class SplashScreenController extends GetxController {
  final SplashScreenDataSource dataSource;
  final FirebaseAuthService firebaseAuthService;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Logger logger = Logger();

  SplashScreenController({
    required this.dataSource,
    required this.firebaseAuthService,
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    check();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> check() async {
    if (firebaseAuth.currentUser != null) {
      try {
        await firebaseAuthService.reloadUser();
        final result = await dataSource.status();

        result.fold(
          (error) {
            logger.e("Failed to fetch user status: ${error.message}");
            Snackbars.error(title: "Session Expired", message: error.message);
            Get.offAllNamed(Routes.GET_STARTED);
          },
          (value) {
            _navigateBasedOnStatus(value);
          },
        );
      } catch (e) {
        logger.e("Error during session check: $e");
        Snackbars.info(
          title: "Session Expired",
          message: "Please login or signup again",
        );
        Get.offAllNamed(Routes.GET_STARTED);
      }
    } else {
      Get.offAllNamed(Routes.GET_STARTED);
    }
  }

  void _navigateBasedOnStatus(String status) {
    switch (status) {
      case 'gender':
        Snackbars.info(
          title: "Incomplete Registration",
          message: "Please complete your registration",
        );
        Get.offAllNamed(Routes.GENDER_PAGE);
        break;
      case 'basicInfo':
        Snackbars.info(
          title: "Incomplete Registration",
          message: "Please complete your registration",
        );
        Get.offAllNamed(Routes.BASIC_INFO_PAGE);
        break;
      case 'complete':
        Get.offAllNamed(Routes.MAIN);
        break;
      default:
        logger.w("Unexpected status value: $status");
        Snackbars.error(
          title: "Error",
          message: "Unexpected registration status",
        );
        Get.offAllNamed(Routes.GET_STARTED);
    }
  }
}
