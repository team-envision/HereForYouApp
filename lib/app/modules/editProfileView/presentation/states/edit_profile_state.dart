import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileState extends GetXState {
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  String gender = '';
}
