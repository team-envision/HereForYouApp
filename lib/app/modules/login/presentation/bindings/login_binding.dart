import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/login/data/login_data_sources.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../controllers/login_controller.dart';
import '../states/login_state.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        state: LoginState(),
        dataSources: LoginDataSources(
          firebaseFirestoreService: FirebaseFirestoreService(),
          firebaseAuthService: FirebaseAuthService(),
        ),
      ),
    );
  }
}
