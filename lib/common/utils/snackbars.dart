import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class Snackbars {
  Snackbars._();

  static void _show({
    required String title,
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: const SizedBox.shrink(),
      messageText: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: textColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: textColor, size: 22.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.urbanist(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    message,
                    style: GoogleFonts.urbanist(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: textColor.withOpacity(0.85),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      borderRadius: 12.r,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      boxShadows: const [
        BoxShadow(
          color: AppColors.shadowCloudLevel1,
          offset: Offset(0, 0),
          blurRadius: 0,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: AppColors.shadowCloudLevel1,
          offset: Offset(0, 4),
          blurRadius: 12,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: AppColors.shadowCloudLevel3,
          offset: Offset(0, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Success snackbar - Green theme
  static void success({required String title, required String message}) {
    _show(
      title: title,
      message: message,
      backgroundColor: const Color(0xFF10B981),
      textColor: Colors.white,
      icon: Icons.check_circle_rounded,
    );
  }

  /// Error snackbar - Red theme
  static void error({required String title, required String message}) {
    _show(
      title: title,
      message: message,
      backgroundColor: const Color(0xFFEF4444),
      textColor: Colors.white,
      icon: Icons.error_rounded,
    );
  }

  /// Warning snackbar - Orange theme
  static void warning({required String title, required String message}) {
    _show(
      title: title,
      message: message,
      backgroundColor: const Color(0xFFF59E0B),
      textColor: Colors.white,
      icon: Icons.warning_rounded,
    );
  }

  /// Info snackbar - Blue theme
  static void info({required String title, required String message}) {
    _show(
      title: title,
      message: message,
      backgroundColor: const Color(0xFF3B82F6),
      textColor: Colors.white,
      icon: Icons.info_rounded,
    );
  }

  /// Custom snackbar with custom colors
  static void custom({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
  }) {
    _show(
      title: title,
      message: message,
      backgroundColor: backgroundColor ?? AppColors.white,
      textColor: textColor ?? AppColors.black,
      icon: icon ?? Icons.notifications_rounded,
    );
  }
}
