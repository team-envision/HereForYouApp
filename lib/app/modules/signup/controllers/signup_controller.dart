import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/signup/states/signup_state.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

import '../../../../common/firebase/firebase_auth.dart';

class SignupController extends GetxController {
  final SignUpState state;
  final FirebaseAuthService _authService = FirebaseAuthService();

  SignupController({required this.state});

  Future<void> handleSignUp() async {
    if (state.formKey.currentState?.validate() ?? false) {
      try {
        final user = await _authService.signUp(
          name: state.nameController.text,
          email: state.emailController.text,
          password: state.passwordController.text,
          phone: state.phoneController.text,
        );

        if (user != null) {
          Get.offAllNamed(Routes.FACE_LOADING);
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
