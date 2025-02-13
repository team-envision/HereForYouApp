import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';
import '../widgets/edit_profile_widgets.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final controller = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
          size: 35,),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Row(
          children: [
            Text(
              'Edit Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Name',
                hintText: 'Enter your name',
                controller: controller.nameController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Phone number',
                hintText: 'Enter your phone number',
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email',
                hintText: 'Enter your email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              Obx(() => CustomDropdown(
                label: 'Gender',
                value: controller.gender.value.isEmpty
                    ? null
                    : controller.gender.value,
                items: const ['Male', 'Female', 'Other'],
                onChanged: (value) {
                  controller.gender.value = value ?? '';
                },
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
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: CustomTextField(
                      label: 'Weight',
                      hintText: 'Enter your weight',
                      controller: controller.weightController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  controller.saveDetails();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
