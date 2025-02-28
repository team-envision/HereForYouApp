import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';
import '../widgets/edit_profile_widgets.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final controller = Get.find<EditProfileController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 35),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Name',
                  hintText: 'Enter your name',
                  controller: controller.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Phone number',
                  hintText: 'Enter your phone number',
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    } else if (!RegExp(r'^[0-9]{10}\$').hasMatch(value)) {
                      return 'Enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\$').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Obx(() => CustomDropdown(
                  label: 'Gender',
                  value: controller.gender.value.isEmpty ? null : controller.gender.value,
                  items: const ['Male', 'Female', 'Other'],
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                  },
                  validator: (value) => value == null || value.isEmpty ? 'Please select a gender' : null, // Validation message
                )),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        label: 'Age',
                        hintText: 'Enter your age',
                        controller: controller.ageController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Age is required';
                          } else if (int.tryParse(value) == null || int.parse(value) <= 0) {
                            return 'Enter a valid age';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: CustomTextField(
                        label: 'Weight',
                        hintText: 'Enter your weight',
                        controller: controller.weightController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Weight is required';
                          } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
                            return 'Enter a valid weight';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.saveDetails();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
