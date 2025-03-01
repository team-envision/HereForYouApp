import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final gender = ''.obs;

  void saveDetails() {
    print("Details Saved!");
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    ageController.dispose();
    weightController.dispose();
    super.onClose();
  }
}
