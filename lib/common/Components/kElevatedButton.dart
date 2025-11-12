import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class kElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? trailingIcon;
  final Color backgroundColor;
  final Color borderColor;
  final double fontSize;
  final bool isLoading;

  const kElevatedButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
    this.trailingIcon,
    this.backgroundColor = AppColors.black,
    this.borderColor = AppColors.white,
    this.fontSize = 19,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: borderColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        textStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.w800,
          fontSize: fontSize,
          letterSpacing: -0.4,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 30.w,
              child: const CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 2,
              ),
            )
          : trailingIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text),
                SizedBox(width: 10.w),
                SvgPicture.asset(
                  trailingIcon!,
                  color: AppColors.white,
                  height: 13.06.h,
                  width: 12.53.w,
                ),
              ],
            )
          : Text(text),
    );
  }
}
