import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergencyContactController extends GetxController {
  final formKey = GlobalKey<FormState>();

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

  // Observables for each form field
  var name = ''.obs;
  var mobileNumber = ''.obs;
  var email = ''.obs;
  var relation = ''.obs;

  // Method to validate and save form
  void saveDetails() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // Perform additional logic for saving the data
      Get.snackbar('Success', 'Emergency contact details saved successfully',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar(
        'Error',
        'Please fill all fields correctly',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

