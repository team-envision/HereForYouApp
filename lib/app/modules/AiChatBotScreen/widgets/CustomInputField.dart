import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/app_resources/app_colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.genericShadow,
            offset: Offset(0, 0),
            blurRadius: 11.9,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        style: GoogleFonts.urbanist(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 22.w,
            vertical: 13.h,
          ),
          hintText: "Ask your question",
          hintStyle: GoogleFonts.urbanist(
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: AppColors.textHintMuted,
          ),
        ),
      ),
    );
  }
}
