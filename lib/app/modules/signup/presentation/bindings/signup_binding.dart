import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/signup/data/signup_data_sources.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../../../../../common/firebase/firebase_auth.dart';
import '../controllers/signup_controller.dart';
import '../states/signup_state.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(
        state: SignUpState(),
        signupDataSources: SignupDataSources(
          firebaseAuthService: FirebaseAuthService(),
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
      ),
    );
  }
}
