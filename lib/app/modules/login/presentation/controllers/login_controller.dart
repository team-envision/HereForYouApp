import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/login/data/login_data_sources.dart';
import 'package:here_for_you_app/common/Components/customPopup.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:logger/logger.dart';

import '../../../../routes/app_pages.dart';
import '../states/login_state.dart';

class LoginController extends GetxController {
  final LoginState state;
  final LoginDataSources dataSources;
  final Logger logger = Logger();

  LoginController({required this.state, required this.dataSources});

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

  Future<void> handleSignIn() async {
    // Prevent multiple simultaneous login attempts
    if (state.isLogging.value) {
      Snackbars.info(
        title: "Logging in...",
        message: "Please wait while we log you in.",
      );
      return;
    }

    if (!(state.formKey.currentState?.validate() ?? false)) {
      return;
    }

    state.isLogging.value = true;

    try {
      final email = state.emailController.text.trim();
      final password = state.passwordController.text.trim();

      final loginResult = await dataSources.login(email, password);

      await loginResult.fold(
        (error) async {
          Snackbars.error(title: "Error", message: error.message);
        },
        (user) async {
          // Check if email is verified
          if (!user.emailVerified) {
            final emailResult = await dataSources.sendVerificationEmail();
            emailResult.fold(
              (error) {
                Snackbars.error(
                  title: "Email not verified",
                  message: error.message,
                );
              },
              (_) {
                CustomPopup.show(
                  barrierDismissible: false,
                  title: "Link sent! Verify through your email.",
                  acceptTitle: "Done",
                  cancelTitle: "Resend",
                  onAccept: () => checkVerificationAndProceed(),
                  onCancel: () => resendVerificationEmail(),
                );
              },
            );
          } else {
            _proceedWithStatusCheck();
          }
        },
      );
    } finally {
      state.isLogging.value = false;
    }
  }

  Future<void> checkVerificationAndProceed() async {
    Snackbars.info(
      title: "Checking...",
      message: "Please wait while we verify your email status.",
    );

    final userResult = await dataSources.getUser();

    userResult.fold(
      (error) {
        Snackbars.error(title: "Error", message: error.message);
      },
      (user) {
        if (user?.emailVerified ?? false) {
          Snackbars.success(
            title: "Success",
            message: "Email verified successfully",
          );
          _proceedWithStatusCheck();
        } else {
          Snackbars.info(
            title: "Email Not Verified",
            message: "Please verify your email first and try again.",
          );
        }
      },
    );
  }

  Future<void> resendVerificationEmail() async {
    Snackbars.info(
      title: "Sending email...",
      message: "Please wait for a few moments",
    );

    final result = await dataSources.sendVerificationEmail();

    result.fold(
      (error) {
        Snackbars.error(title: "Error", message: error.message);
      },
      (_) {
        Snackbars.success(
          title: "Success",
          message: "Verification email sent. Please check your inbox.",
        );
      },
    );
  }

  Future<void> _proceedWithStatusCheck() async {
    final statusResult = await dataSources.status();

    statusResult.fold(
      (error) {
        Snackbars.info(
          title: "Error",
          message: error.message,
        );
      },
      (value) {
        _navigateBasedOnStatus(value);
      },
    );
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
        Snackbars.error(
          title: "Error",
          message: "Unexpected registration status: $status",
        );
        logger.w("Unexpected status value: $status");
    }
  }
}
