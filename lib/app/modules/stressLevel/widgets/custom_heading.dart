import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class CustomHeading extends StatelessWidget {
  final String reading;
  final String label;

  const CustomHeading({super.key, required this.reading, required this.label});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: reading,
            style: GoogleFonts.urbanist(
              fontSize: 12.94.sp,
              color: AppColors.stressText,
              fontWeight: FontWeight.w900,
            ),
          ),
          TextSpan(
            text: label,
            style: GoogleFonts.urbanist(
              fontSize: 12.94.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
