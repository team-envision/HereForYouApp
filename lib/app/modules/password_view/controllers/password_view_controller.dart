import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordViewController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  void saveNewPassword() {
    if (newPasswordController.text == confirmPasswordController.text &&
        newPasswordController.text.isNotEmpty) {
      Get.snackbar("Success", "Password changed successfully",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
