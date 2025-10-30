import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpState extends GetXState {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
}
