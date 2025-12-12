import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/signup/data/signup_data_sources.dart';
import 'package:here_for_you_app/common/Components/customPopup.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';

import '../../../../routes/app_pages.dart';
import '../states/signup_state.dart';

class SignupController extends GetxController {
  final SignUpState state;
  final SignupDataSources signupDataSources;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  SignupController({required this.state, required this.signupDataSources});

  @override
  void onClose() {
    state.dispose();
    super.onClose();
  }

  Future<void> signUp() async {
    if (state.isSigningUp.value) {
      Snackbars.info(title: "Please wait...", message: "We are signing you in");
      return;
    }
    if (!(state.formKey.currentState?.validate() ?? false)) {
      return;
    }
    state.isSigningUp.value = true;
    final email = state.emailController.text.trim();
    final password = state.passwordController.text.trim();
    final name = state.nameController.text.trim();
    final phone = state.phoneController.text.trim();
    final result = await signupDataSources.signUp(
      email: email,
      password: password,
    );
    result.fold(
      (error) {
        Snackbars.error(title: "Couldn't sign up", message: error.message);
        state.isSigningUp.value = false;
      },
      (user) async {
        final result = await signupDataSources.createUserDocument(
          name: name,
          email: email,
          phone: phone,
        );
        result.fold(
          (error) {
            //TODO: Logout user, how to handle at login, ask didi
            Snackbars.error(
              title: "Couldn't create your account",
              message: "Please contact admin to sort out",
            );
            state.isSigningUp.value = false;
          },
          (_) async {
            final result = await signupDataSources.sendVerificationEmail();
            result.fold(
              (error) {
                Snackbars.error(
                  title:
                      "Account created, could send verification mail, please login again.",
                  message: error.message,
                );
                //TODO: Logout user
                state.isSigningUp.value = false;
              },
              (_) {
                CustomPopup.show(
                  title: "Please click the link sent to your mail",
                  cancelTitle: "Resend",
                  acceptTitle: "Done",
                  onCancel: resendVerificationEmail,
                  onAccept: isVerified,
                );
                state.isSigningUp.value = false;
              },
            );
          },
        );
      },
    );
  }

  void navigate(DocumentSnapshot doc) {
    try {
      final String value = doc.get("status") as String;

      switch (value) {
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
          Snackbars.error(
            title: "Error",
            message: "Unexpected registration status: $value",
          );
      }
    } catch (e) {
      Snackbars.error(
        title: "Error",
        message: "Failed to read registration status",
      );
    }
  }

  Future<void> resendVerificationEmail() async {
    final result = await signupDataSources.sendVerificationEmail();
    result.fold(
      (error) {
        Snackbars.error(title: "Error", message: error.message);
      },
      (value) {
        Snackbars.success(
          title: "Success",
          message: "Verification email resent",
        );
      },
    );
  }

  Future<void> isVerified() async {
    final result = await signupDataSources.getUser();

    result.fold(
      (error) {
        Snackbars.error(title: "Error", message: error.message);
      },
      (user) {
        if (user?.emailVerified ?? false) {
          Snackbars.success(
            title: "Success",
            message: "Email verified successfully",
          );
          Get.offAllNamed(Routes.GENDER_PAGE);
        } else {
          Snackbars.info(
            title: "Email not verified",
            message: "Please verify your email first",
          );
        }
      },
    );
  }
}
