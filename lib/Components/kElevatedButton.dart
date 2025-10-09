import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class kElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? leadingIcon;
  final Color backgroundColor;
  final Color borderColor;

  const kElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.backgroundColor = AppColors.black,
    this.borderColor = AppColors.white,

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
          fontSize: 19.sp,
          letterSpacing: -0.4,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
      child: leadingIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text),
                SizedBox(width: 10.w),
                SvgPicture.asset(
                  leadingIcon!,
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
