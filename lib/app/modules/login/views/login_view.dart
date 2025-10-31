import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/Components/kInputField.dart';
import 'package:here_for_you_app/app/modules/home/views/home_view.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),
                SvgPicture.asset(
                  width: 230.75.w,
                  height: 248.43.h,
                  'lib/assets/images/loginBanner.svg',
                ),
                SizedBox(height: 10.h),
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 36.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                kInputField(
                  inputType: TextInputType.emailAddress,
                  title: "Email",
                  hint: "Enter email",
                  onChanged: (String value) {},
                ),
                SizedBox(height: 18.h),
                kInputField(
                  inputType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  title: "Password",
                  hint: "Enter password",
                  onChanged: (String value) {},
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.urbanist(
                        color: AppColors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 12.63.sp,
                        letterSpacing: -0.3,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 49.h,
                  width: double.infinity,
                  child: kElevatedButton(
                    text: "Sign in",
                    onPressed: () {
                      Get.offAll(() => const HomeView());
                    },
                  ),
                ),
                SizedBox(height: 18.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.5.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "OR",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 11.43.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Divider(
                          thickness: 1.5.h,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  height: 49.h,
                  width: double.infinity,
                  child: kElevatedButton(
                    text: "Sign up",
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.black,
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
