import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpState {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Reactive variables - these work because GetX provides .obs extension
  final isGoogleSigningIn = false.obs;
  final isSigningUp = false.obs;
  final isGoogleSignUpMode = false.obs;
  final isResendEmailSent = false.obs;

  // Clean up controllers when state is disposed
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
