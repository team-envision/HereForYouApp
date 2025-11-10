import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class OutLinedGender extends StatelessWidget {
  const OutLinedGender({
    super.key,
    required this.text,
    required this.svgPic,
    required this.backColor,
    required this.borderColor,
    required this.onPressed,
    this.isSelected = false,
  });

  final VoidCallback onPressed;
  final String text;
  final String svgPic;
  final Color backColor;
  final Color borderColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 77.9.h,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.black : backColor,
          side: BorderSide(
            color: isSelected ? AppColors.black : borderColor, // Outline color
            width: 0.84.w, // Outline width
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(41.04.r), // Rounded corners
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                svgPic,
                fit: BoxFit.fitWidth,
                height: 30.15.h,
                width: 30.15.w,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.white : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                text,
                style: GoogleFonts.urbanist(
                  color: isSelected
                      ? AppColors.white
                      : AppColors.textPrimaryDark,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.56.sp,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
