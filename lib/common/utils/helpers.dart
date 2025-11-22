import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpers {
  Helpers._();

  static String? validateEmail(String? value) {
    return value!.isEmail ? null : "Enter a valid email";
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character";
    }
    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  static String? validateMobileNumber(String? value) {
    return value!.isPhoneNumber ? null : "Enter a valid phone number";
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    TextEditingController passwordController,
  ) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    String? password = passwordController.text;

    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return "Age is required";
    }

    final age = int.tryParse(value);

    if (age == null) {
      return "Please enter a valid age";
    }

    if (age < 1 || age > 120) {
      return "Age must be between 1 and 120";
    }

    return null;
  }

  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return "Weight is required";
    }

    final weight = double.tryParse(value);

    if (weight == null) {
      return "Please enter a valid weight";
    }

    if (weight < 1 || weight > 500) {
      return "Weight must be between 1 and 500 kg";
    }

    return null;
  }

  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return "Height is required";
    }

    final height = double.tryParse(value);

    if (height == null) {
      return "Please enter a valid height";
    }

    if (height < 50 || height > 300) {
      return "Height must be between 50 and 300 cm";
    }

    return null;
  }
}
