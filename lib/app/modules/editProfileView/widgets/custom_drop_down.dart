import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/app_resources/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> genderList;
  final Function(dynamic) onChanged;
  final String initialValue;

  const CustomDropDown({
    super.key,
    this.genderList = const ["Male", "Female", "Other"],
    required this.onChanged,
    this.initialValue = "Male",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
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
                  color: AppColors.genericShadow,
                  offset: Offset(0, 0),
                  blurRadius: 11.9,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              initialValue: initialValue,
              dropdownColor: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              elevation: 4,

              style: GoogleFonts.urbanist(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: AppColors.black,
              ),

              icon: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.black,
                ),
              ),
              decoration: InputDecoration(
                errorStyle: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                  color: AppColors.red,
                ),
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
              ),
              items: genderList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
