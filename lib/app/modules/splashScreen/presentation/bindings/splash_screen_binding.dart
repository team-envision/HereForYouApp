import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/splashScreen/data/splash_screen_data_source.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashScreenController(
        firebaseAuthService: FirebaseAuthService(),
        dataSource: SplashScreenDataSource(
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
      ),
    );
  }
}
