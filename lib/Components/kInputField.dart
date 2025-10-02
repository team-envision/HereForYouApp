import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class kInputField extends StatelessWidget {
  final String title;
  final String hint;
  final Function(String) onChanged;
  final TextInputType inputType;

  const kInputField({
    super.key,
    required this.title,
    required this.hint,
    required this.onChanged,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w800,
              fontSize: 14.86.sp,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x2B000000),
                  offset: Offset(0, 0),
                  blurRadius: 11.9,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: TextFormField(
              keyboardType: inputType,
              onChanged: onChanged,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 13.h,
                  ),
                  hintText: hint,
                  hintStyle: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: Color(0x7D201A25),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
