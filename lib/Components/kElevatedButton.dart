import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class kElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? leadingIcon;

  const kElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        textStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.w800,
          fontSize: 21.07.sp,
          letterSpacing: -0.4,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
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
                  color: Colors.white,
                  height: 16.06.h,
                  width: 12.53.w,
                ),
              ],
            )
          : Text(text),
    );
  }
}
