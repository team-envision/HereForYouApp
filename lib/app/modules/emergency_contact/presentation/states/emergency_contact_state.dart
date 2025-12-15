import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergencyContactState extends GetXState {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final relationController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isDataLoading = true.obs;
}
