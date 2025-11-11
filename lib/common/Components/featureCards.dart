import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

Widget kContainer({
  required Color color,
  required String text,
  required Widget icon,
  dynamic? onTap,
  String? subText,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(23.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              text,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 22.29.sp,
                color: AppColors.white,
                height: 24 / (22.29.sp),
              ),
            ),
          ),
          icon,
        ],
      ),
    ),
  );
}
