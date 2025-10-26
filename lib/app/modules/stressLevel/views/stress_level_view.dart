import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/stress_level_controller.dart';

class StressLevelView extends GetView<StressLevelController> {
  const StressLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StressLevelView'), centerTitle: true),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 366.w,
              height: 27.h,
              padding: EdgeInsets.symmetric(horizontal: 29.w),
              decoration: BoxDecoration(
                color: Color(0xFFE8EDDF),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(reading: "(0-40) - ", label: "Low"),
                  CustomText(reading: "(41-70) - ", label: "Medium"),
                  CustomText(reading: "(71-100) - ", label: "High"),
                ],
              ),
            ),
            SizedBox(height: 39.21.h),
            Text(
              "Your Stress Level: 80/100 ",
              style: GoogleFonts.urbanist(
                fontSize: 28.34.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.01 * 28.34.sp,
                color: Color(0xFF4E7309),
              ),
            ),
            Container(
              width: 341.w,
              child: Text(
                textAlign: TextAlign.center,
                "It looks like your stress levels are high. This can happen due to various factors like work, relationships, or life changes, and it’s important to take it seriously. High stress, if left unchecked, can affect your mental and physical well-being.",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.91,
                  letterSpacing: 0.01 * 13.91.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomText({required reading, required label}) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: reading,
            style: GoogleFonts.urbanist(
              fontSize: 12.94.sp,
              color: Color(0xFF618C10),
              fontWeight: FontWeight.w900,
            ),
          ),
          TextSpan(
            text: label,
            style: GoogleFonts.urbanist(
              fontSize: 12.94.sp,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
