import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/Components/kInputField.dart';

import '../controllers/basic_info_page_controller.dart';


class BasicInfoView extends GetView<BasicInfoPageController> {
  const BasicInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Some Basic Info',
                  style: Get.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
        
              // Age Input
              kInputField(
                title: 'Age',
                hint: 'Enter your age',
                onChanged: (value) => controller.age.value = value,
              ),
              const SizedBox(height: 20),
        
              // Weight Input
              kInputField(
                title: 'Weight (in kg)',
                hint: 'Enter your weight in kilograms',
                onChanged: (value) => controller.weight.value = value,
              ),
              const SizedBox(height: 20),
        
              // Height Input
              kInputField(
                title: 'Height (in metres)',
                hint: 'Enter your height in metres',
                onChanged: (value) => controller.height.value = value,
              ),
              const SizedBox(height: 80),
        
                 kElevatedButton(
                   onPressed: (){},
                   text: "Next",
                 )
        
            ],
          ),
        ),
      ),
    );
  }


}
