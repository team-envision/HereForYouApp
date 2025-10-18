import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/Components/kInputField.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Change Password",
          style: GoogleFonts.urbanist(
            fontSize: 24.95.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
        titleSpacing: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: () {},
          icon: Transform.flip(
            flipX: true,
            child: SvgPicture.asset(
              "lib/assets/images/forward.svg",
              height: 22.43.h,
              width: 17.5.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              kInputField(
                controller: controller.state.oldPasswordController,
                isPasswordField: true,
                inputType: TextInputType.visiblePassword,
                title: "Old password",
                hint: "Enter old password",
                onChanged: (String value) {},
              ),
              SizedBox(height: 24.h),
              kInputField(
                controller: controller.state.newPasswordController,
                isPasswordField: true,
                inputType: TextInputType.visiblePassword,
                title: "New password",
                hint: "Enter new password",
                onChanged: (String value) {},
              ),
              SizedBox(height: 24.h),
              kInputField(
                controller: controller.state.confirmPasswordController,
                isPasswordField: true,
                inputType: TextInputType.visiblePassword,
                title: "Confirm password",
                hint: "Confirm new password",
                onChanged: (String value) {},
              ),
              SizedBox(height: 55.h),
              SizedBox(
                width: double.infinity,
                height: 49.h,
                child: kElevatedButton(
                  fontSize: 21.07.sp,
                  text: "Save Password",
                  onPressed: controller.handleClick,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
