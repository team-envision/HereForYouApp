import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/custom_divider.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/Components/kInputField.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                Form(
                  key: controller.state.formKey,
                  child: Column(
                    children: [
                      kInputField(
                        controller: controller.state.nameController,
                        title: "Name",
                        hint: "Enter your name",
                        inputType: TextInputType.name,
                        validator: (String? value) {},
                      ),
                      SizedBox(height: 20.h),
                      kInputField(
                        controller: controller.state.phoneController,
                        title: "Phone",
                        hint: "Enter your phone number",
                        inputType: TextInputType.phone,
                        validator: (String? value) {
                          return value!.isPhoneNumber
                              ? null
                              : "Enter a valid phone number";
                        },
                      ),
                      SizedBox(height: 20.h),
                      kInputField(
                        controller: controller.state.emailController,
                        title: "Email",
                        hint: "Enter your email",
                        inputType: TextInputType.emailAddress,
                        validator: (String? value) {
                          return value!.isEmail ? null : "Enter a valid email";
                        },
                      ),
                      SizedBox(height: 20.h),
                      kInputField(
                        controller: controller.state.passwordController,
                        title: "Password",
                        hint: "Enter your password",
                        isPasswordField: true,
                        inputType: TextInputType.visiblePassword,
                        validator: (String? value) {},
                      ),
                      SizedBox(height: 20.h),
                      kInputField(
                        controller: controller.state.confirmPasswordController,
                        title: "Confirm Password",
                        hint: "Confirm your password",
                        isPasswordField: true,
                        inputType: TextInputType.visiblePassword,
                        validator: (String? value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  width: double.infinity,
                  height: 47.h,
                  child: kElevatedButton(
                    text: "Sign up",
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: CustomDivider(),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      foregroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    icon: SvgPicture.asset(
                      "lib/assets/icons/googleIcon.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                    onPressed: () {},
                    label: Text(
                      "Sign in with Google",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.LOGIN),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.black,
                  ),
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.urbanist(
                      fontSize: 14.96.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
