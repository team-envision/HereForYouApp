import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/signup/data/signup_data_sources.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';

import '../../../../routes/app_pages.dart';
import '../states/signup_state.dart';

class SignupController extends GetxController {
  final SignUpState state;
  final SignupDataSources signupDataSources;

  SignupController({required this.state, required this.signupDataSources});

  Future<void> handleSignUp() async {
    if (state.isGoogleSigning.value || state.isSigningIn.value) {
      Snackbars.info(title: "Please wait...", message: "We are signing you in");
    } else {
      if (state.formKey.currentState?.validate() ?? false) {
        state.isSigningIn.value = true;
        final email = state.emailController.text;
        final password = state.passwordController.text;
        final name = state.nameController.text;
        final phone = state.phoneController.text;
        final result = await signupDataSources.signup(
          email: email,
          password: password,
          name: name,
          phone: phone,
        );
        result.fold(
          (error) {
            Snackbars.error(title: "Error", message: error.message);
            state.isSigningIn.value = false;
          },
          (user) {
            Get.offAllNamed(Routes.GENDER_PAGE);
            state.isSigningIn.value = false;
          },
        );
      }
    }
  }

  Future<void> handleGoogleSignIn() async {}
}
