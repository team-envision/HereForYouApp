import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/common/Components/kInputField.dart';
import 'package:here_for_you_app/common/Components/loading_overlay.dart';
import 'package:here_for_you_app/common/utils/helpers.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../../../../../common/Components/kElevatedButton.dart';
import '../controllers/emergency_contact_controller.dart';

class EmergencyContactView extends GetView<EmergencyContactController> {
  const EmergencyContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.state.isDataLoading.value,
        loadingAnimation: "assets/animations/loadingFace.gif",
        size: 92,
        child: content(),
      ),
    );
  }

  Widget content() {
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
          'Emergency Contact',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w800,
            fontSize: 24.95.sp,
            letterSpacing: -0.3,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Form(
            key: controller.state.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                kInputField(
                  validator: Helpers.validateName,
                  inputType: TextInputType.name,
                  controller: controller.state.nameController,
                  title: "Name",
                  hint: "Enter emergency contact name",
                ),
                SizedBox(height: 24.h),

                kInputField(
                  validator: Helpers.validateMobileNumber,
                  inputType: TextInputType.phone,
                  controller: controller.state.phoneController,
                  title: "Mobile Number",
                  hint: "Enter emergency contact number",
                ),
                SizedBox(height: 24.h),

                kInputField(
                  validator: Helpers.validateEmail,
                  inputType: TextInputType.emailAddress,
                  controller: controller.state.emailController,
                  title: "Email",
                  hint: "Enter emergency contact email",
                ),
                SizedBox(height: 24.h),

                kInputField(
                  validator: Helpers.validateNonEmpty,
                  inputType: TextInputType.name,
                  controller: controller.state.relationController,
                  title: "Relation",
                  hint: "How is emergency contact related to you?",
                ),
                SizedBox(height: 48.h),
                SizedBox(
                  width: double.infinity,
                  height: 49.h,
                  child: Obx(
                    () => kElevatedButton(
                      isLoading: controller.state.isLoading.value,
                      text: "Save Details",
                      fontSize: 21.07.sp,
                      onPressed: controller.save,
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
