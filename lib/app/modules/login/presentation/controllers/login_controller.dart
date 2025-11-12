import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/login/data/login_data_sources.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:logger/logger.dart';

import '../../../../routes/app_pages.dart';
import '../states/login_state.dart';

class LoginController extends GetxController {
  final LoginState state;
  final LoginDataSources dataSources;
  Logger logger = Logger();

  LoginController({required this.state, required this.dataSources});

  Future<void> handleSignIn() async {
    if (state.isLogging.value) {
      Snackbars.info(
        title: "Logging in...",
        message: "Please wait while we log you in.",
      );
    } else {
      if (state.formKey.currentState?.validate() ?? false) {
        state.isLogging.value = true;
        final email = state.emailController.text.trim();
        final password = state.passwordController.text.trim();
        final result = await dataSources.login(email, password);
        result.fold(
          (error) {
            Snackbars.error(title: "Error", message: error.message);
          },
          (user) async {
            final result = await dataSources.status();

            result.fold(
              (error) {
                Snackbars.error(title: "Error", message: error.message);
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
          },
        );
        state.isLogging.value = false;
      }
    }
  }

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
}
