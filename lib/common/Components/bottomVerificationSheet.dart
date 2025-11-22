import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/app_resources/app_colors.dart';
import 'custom_divider.dart';
import 'kElevatedButton.dart';

class BottomVerificationSheet {
  BottomVerificationSheet._();

  static void show({
    required String email,
    required VoidCallback onVerified,
    required VoidCallback onResend,
    required VoidCallback onChange,
  }) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        height: Get.height * 0.42,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Column(
          children: [
            Text(
              "Verification Email Sent!",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "We have sent a verification link to your email",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
            Text(
              email,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),

            SizedBox(height: 40.h),
            SizedBox(
              height: 44.h,
              width: Get.width,
              child: kElevatedButton(
                text: "I've verified",
                onPressed: onVerified,
                backgroundColor: AppColors.black,
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: CustomDivider(),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 44.h,
              width: Get.width,
              child: kElevatedButton(
                text: "Resend",
                onPressed: onResend,
                backgroundColor: AppColors.white,
                borderColor: AppColors.black,
              ),
            ),
            SizedBox(height: 15.h),
            TextButton(
              onPressed: onChange,
              style: TextButton.styleFrom(foregroundColor: AppColors.black),
              child: Text(
                "Use a different mail?",
                style: GoogleFonts.urbanist(
                  fontSize: 14.96.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
    );
  }
}
