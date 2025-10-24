import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDivider extends StatelessWidget {
  final String text;

  const CustomDivider({
    super.key,
    this.text = "OR",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
