import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/Components/kInputField.dart';
import 'package:here_for_you_app/common/utils/helpers.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/basic_info_page_controller.dart';

class BasicInfoView extends GetView<BasicInfoPageController> {
  const BasicInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Transform.flip(
            flipX: true,
            child: SvgPicture.asset("assets/images/forward.svg", height: 20.h),
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 125.h),
              Center(
                child: Text(
                  'Some Basic Info',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w800,
                    fontSize: 37.5.sp,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Age Input
              Form(
                key: controller.state.formKey,
                child: Column(
                  children: [
                    kInputField(
                      validator: Helpers.validateAge,
                      controller: controller.state.ageController,
                      title: 'Age',
                      hint: 'Enter your age',
                    ),
                    const SizedBox(height: 20),

                    // Weight Input
                    kInputField(
                      validator: Helpers.validateWeight,
                      controller: controller.state.weightController,
                      title: 'Weight (in kg)',
                      hint: 'Enter your weight in kilograms',
                    ),
                    const SizedBox(height: 20),

                    // Height Input
                    kInputField(
                      validator: Helpers.validateHeight,
                      controller: controller.state.heightController,
                      title: 'Height (in metres)',
                      hint: 'Enter your height in metres',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),

              SizedBox(
                height: 47.h,
                width: double.infinity,
                child: kElevatedButton(
                  onPressed: controller.handleNext,
                  text: "Next",
                  trailingIcon: "assets/images/forward.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
