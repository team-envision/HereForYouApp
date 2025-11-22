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

  Future<void> handleSignUp() async {
    // Prevent double submission
    if (state.isGoogleSigningIn.value || state.isSigningUp.value) {
      Snackbars.info(title: "Please wait...", message: "We are signing you in");
      return;
    }

    // Validate form
    if (!(state.formKey.currentState?.validate() ?? false)) {
      return;
    }

    state.isSigningUp.value = true;

    try {
      final email = state.emailController.text.trim();
      final password = state.passwordController.text;
      final name = state.nameController.text.trim();
      final phone = state.phoneController.text.trim();

      if (state.isGoogleSignUpMode.value) {
        // Complete Google sign-up by linking password
        await finishGoogleSignUp(
          password: password,
          name: name,
          phone: phone,
          email: email,
        );
      } else {
        // Regular email/password sign-up
        await signUp(
          email: email,
          password: password,
          name: name,
          phone: phone,
        );
      }
    } finally {
      state.isSigningUp.value = false;
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final result = await signupDataSources.signup(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    result.fold(
      (error) {
        Snackbars.error(title: "Error", message: error.message);
      },
      (user) async {
        final emailResult = await signupDataSources.sendVerificationEmail();
        emailResult.fold(
          (error) {
            Snackbars.error(
              title: "Unable to send verification email",
              message: error.message,
            );
          },
          (_) {
            CustomPopup.show(
              barrierDismissible: false,
              title: "Link sent! Verify through your email.",
              acceptTitle: "Done",
              cancelTitle: "Resend",
              onAccept: isVerified,
              onCancel: sendVerificationEmail,
            );
          },
        );
      },
    );
  }

  Future<void> finishGoogleSignUp({
    required String password,
    required String name,
    required String phone,
    required String email,
  }) async {
    // Link password credential to Google account
    final linkResult = await signupDataSources.linkPassword(password: password);

    await linkResult.fold(
      (error) async {
        Snackbars.error(title: "Error", message: error.message);
      },
      (userCredential) async {
        // Add user profile data to Firestore
        final addUserResult = await signupDataSources.addUser(
          email: email,
          name: name,
          phone: phone,
        );

        addUserResult.fold(
          (error) {
            Snackbars.error(title: "Error", message: error.message);
          },
          (_) {
            // Google accounts are already verified, go directly to next step
            Snackbars.success(
              title: "Success",
              message: "Account created successfully",
            );
            Get.offAllNamed(Routes.GENDER_PAGE);
          },
        );
      },
    );
  }

  Future<void> handleGoogleSignIn() async {
    // Prevent double submission
    if (state.isGoogleSigningIn.value || state.isSigningUp.value) {
      return;
    }

    state.isGoogleSigningIn.value = true;

    try {
      final result = await signupDataSources.googleSignUp();

      await result.fold(
        (error) async {
          Snackbars.error(title: "Error", message: error.message);
        },
        (user) async {
          // Check if user profile already exists in Firestore
          final profileResult = await signupDataSources.getProfile();

          profileResult.fold(
            (error) {
              Snackbars.error(title: "Error", message: error.message);
            },
            (doc) {
              if (doc.exists) {
                // Existing user - navigate based on registration status
                navigate(doc);
              } else {
                // New Google user - pre-fill form and let them complete signup
                state.nameController.text = user.displayName ?? "";
                state.emailController.text = user.email ?? "";
                state.phoneController.text = user.phoneNumber ?? "";
                state.isGoogleSignUpMode.value = true;

                Snackbars.info(
                  title: "Complete Your Profile",
                  message:
                      "Please add your necessary details and set a password",
                );
              }
            },
          );
        },
      );
    } finally {
      state.isGoogleSigningIn.value = false;
    }
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

  Future<void> sendVerificationEmail() async {
    Snackbars.info(
      title: "Sending email...",
      message: "Please wait for a few moments",
    );

    final result = await signupDataSources.sendVerificationEmail();

    result.fold(
      (error) {
        Snackbars.error(title: "Error", message: error.message);
      },
      (value) {
        Snackbars.success(title: "Success", message: "Verification email sent");
      },
    );
  }

  Future<void> isVerified() async {
    Snackbars.info(
      title: "Verifying...",
      message: "Please wait for a few moments",
    );

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
