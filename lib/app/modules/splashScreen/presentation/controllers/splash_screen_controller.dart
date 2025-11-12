import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/splashScreen/data/splash_screen_data_source.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';

class SplashScreenController extends GetxController {
  bool isLoggedIn = false;
  SplashScreenDataSource dataSource;
  FirebaseAuthService firebaseAuthService;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  SplashScreenController({
    required this.dataSource,
    required this.firebaseAuthService,
  });

  Future<void> check() async {
    if (firebaseAuth.currentUser != null) {
      try {
        await firebaseAuthService.reloadUser();
        final result = await dataSource.status();
        result.fold(
          (error) {
            Snackbars.error(title: "Session Expired", message: error.message);
          },
          (value) {
            if (value == 'gender') {
              Snackbars.info(
                title: "Incomplete Registration",
                message: "Please complete your registration",
              );
              Get.offAllNamed(Routes.GENDER_PAGE);
            } else if (value == 'basicInfo') {
              Snackbars.info(
                title: "Incomplete Registration",
                message: "Please complete your registration",
              );
              Get.offAllNamed(Routes.BASIC_INFO_PAGE);
            } else if (value == 'complete') {
              Get.offAllNamed(Routes.MAIN);
            }
          },
        );
      } catch (e) {
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
}
