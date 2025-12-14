import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/common/Components/kElevatedButton.dart';
import 'package:here_for_you_app/common/Components/kInputField.dart';
import 'package:here_for_you_app/common/utils/helpers.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/edit_profile_controller.dart';
import '../widgets/custom_drop_down.dart';

class EditProfileView extends GetView<EditProfileViewController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: IconButton(
            icon: Image.asset(
              "assets/images/backward_arrow.png",
              width: 34.18.w,
              height: 29.91.h,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Edit Details',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w800,
            fontSize: 24.95.sp,
            letterSpacing: -0.3,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Form(
            key: controller.state.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kInputField(
                  inputType: TextInputType.name,
                  title: "Name",
                  hint: "Enter your name",
                  controller: controller.state.nameController,
                  validator: Helpers.validateName,
                ),
                SizedBox(height: 20.h),
                kInputField(
                  inputType: TextInputType.phone,
                  title: "Phone number",
                  hint: "Enter your phone number",
                  controller: controller.state.phoneController,
                  validator: Helpers.validateMobileNumber,
                ),
                SizedBox(height: 20.h),
                kInputField(
                  readOnly: true,
                  inputType: TextInputType.emailAddress,
                  onTap: () => Snackbars.info(
                    title: "Not Allowed",
                    message: "Email cannot be updated as of now",
                  ),
                  title: "Email",
                  hint: "Enter your email",
                  controller: controller.state.emailController,
                  validator: Helpers.validateEmail,
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => CustomDropDown(
                    onChanged: controller.onChanged,
                    initialValue: controller.state.gender.value,
                  ),
                ),
                SizedBox(height: 20.h),
                kInputField(
                  inputType: TextInputType.number,
                  title: "Age",
                  hint: "Enter your age",
                  controller: controller.state.ageController,
                  validator: Helpers.validateAge,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: kInputField(
                        inputType: TextInputType.number,
                        title: "Height",
                        hint: "Enter your height",
                        controller: controller.state.heightController,
                        validator: Helpers.validateHeight,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: kInputField(
                        inputType: TextInputType.number,
                        title: "Weight",
                        hint: "Enter your weight",
                        controller: controller.state.weightController,
                        validator: Helpers.validateWeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  height: 49.h,
                  width: double.infinity,
                  child: Obx(
                    () => kElevatedButton(
                      isLoading: controller.state.isLoading.value,
                      text: "Save",
                      onPressed: controller.saveDetails,
                      fontSize: 21.07.sp,
                    ),
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
