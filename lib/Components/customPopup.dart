import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class CustomPopup {
  CustomPopup._();

  static void show({
    required String title,
    VoidCallback? onAccept,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    Get.dialog(
      barrierDismissible: barrierDismissible,
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
        backgroundColor: AppColors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.r),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.popupShadow, // #00000040
                offset: Offset(0, 0),
                blurRadius: 5.9,
                spreadRadius: 0,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.68.sp,
                  letterSpacing: 16.68.sp * 0.02,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 118.w,
                    height: 44.h,
                    child: kElevatedButton(
                      borderColor: AppColors.black,
                      backgroundColor: AppColors.white,
                      text: "NO",
                      onPressed: onCancel ?? () {},
                      fontSize: 16.68.sp,
                    ),
                  ),
                  SizedBox(
                    width: 118.w,
                    height: 44.h,
                    child: kElevatedButton(
                      text: "YES",
                      onPressed: onAccept ?? () {},
                      fontSize: 16.68.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
