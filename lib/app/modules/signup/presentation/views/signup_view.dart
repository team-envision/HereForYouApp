import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/common/utils/helpers.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../../../../../common/Components/custom_divider.dart';
import '../../../../../common/Components/kElevatedButton.dart';
import '../../../../../common/Components/kInputField.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                Form(
                  key: controller.state.formKey,
                  child: Column(
                    children: [
                      kInputField(
                        controller: controller.state.nameController,
                        title: "Name",
                        hint: "Enter your name",
                        inputType: TextInputType.name,
                        validator: Helpers.validateName,
                      ),
                      SizedBox(height: 20.h),
                      kInputField(
                        controller: controller.state.phoneController,
                        title: "Phone",
                        hint: "Enter your phone number",
                        inputType: TextInputType.phone,
                        validator: Helpers.validateMobileNumber,
                      ),
                      SizedBox(height: 20.h),
                      kInputField(
                        controller: controller.state.emailController,
                        title: "Email",
                        hint: "Enter your email",
                        inputType: TextInputType.emailAddress,
                        validator: Helpers.validateEmail,
                      ),
                      SizedBox(height: 20.h),
                      kInputField(
                        controller: controller.state.passwordController,
                        title: "Password",
                        hint: "Enter your password",
                        isPasswordField: true,
                        inputType: TextInputType.visiblePassword,
                        validator: Helpers.validatePassword,
                      ),
                      SizedBox(height: 20.h),
                      kInputField(
                        controller: controller.state.confirmPasswordController,
                        title: "Confirm Password",
                        hint: "Confirm your password",
                        isPasswordField: true,
                        inputType: TextInputType.visiblePassword,
                        validator: (String? value) =>
                            Helpers.validateConfirmPassword(
                              value,
                              controller.state.passwordController,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  width: double.infinity,
                  height: 47.h,
                  child: Obx(
                    () => kElevatedButton(
                      isLoading: controller.state.isSigningUp.value,
                      text: "Sign up",
                      onPressed: controller.signUp,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: const CustomDivider(),
                ),
                SizedBox(height: 15.h),
                // SizedBox(
                //   width: double.infinity,
                //   height: 44.h,
                //   child: Obx(
                //     () => ElevatedButton.icon(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: AppColors.white,
                //         elevation: 0,
                //         foregroundColor: AppColors.black,
                //         shape: RoundedRectangleBorder(
                //           side: const BorderSide(
                //             color: AppColors.black,
                //             width: 1,
                //           ),
                //           borderRadius: BorderRadius.circular(30.r),
                //         ),
                //       ),
                //       icon: controller.state.isGoogleSigningIn.value
                //           ? SizedBox(
                //               width: 20.w,
                //               height: 20.h,
                //               child: const CircularProgressIndicator(
                //                 color: AppColors.black,
                //                 strokeWidth: 2,
                //               ),
                //             )
                //           : SvgPicture.asset(
                //               "assets/icons/googleIcon.svg",
                //               width: 20.w,
                //               height: 20.h,
                //             ),
                //       onPressed: controller.handleGoogleSignIn,
                //       label: controller.state.isGoogleSigningIn.value
                //           ? const SizedBox()
                //           : Text(
                //               "Sign in with Google",
                //               style: GoogleFonts.poppins(
                //                 fontSize: 13.sp,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 49.h,
                  width: double.infinity,
                  child: kElevatedButton(
                    text: "Sign in",
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.black,
                    onPressed: () => Get.offNamed(Routes.LOGIN),
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
