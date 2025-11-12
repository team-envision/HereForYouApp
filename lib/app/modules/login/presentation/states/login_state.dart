import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState extends GetXState {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLogging = false.obs;
}
