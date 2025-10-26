import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/stress_level_controller.dart';

class StressLevelView extends GetView<StressLevelController> {
  const StressLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Stress Level",
          style: GoogleFonts.urbanist(
            fontSize: 24.95.sp,
            letterSpacing: -0.3,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "lib/assets/images/backward_arrow.png",
            width: 34.18.w,
            height: 29.91.h,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 131.h,
            left: 12.w,
            width: 366.w,
            height: 27.h,
            child: Container(
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
          ),
          Positioned(
            width: 364.35.w,
            top: 203.21.h,
            left: 13.65.w,
            child: Text(
              textAlign: TextAlign.center,
              "Your Stress Level: 80/100 ",
              style: GoogleFonts.urbanist(
                fontSize: 28.34.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.01 * 28.34.sp,
                color: Color(0xFF4E7309),
              ),
            ),
          ),
          Positioned(
            top: 253.h,
            left: 26.w,
            width: 341.w,
            height: 110.h,
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
          Positioned(
            top: 590.h,
            left: 124.w,
            height: 341.02.h,
            width: 328.w,
            child: SvgPicture.asset("lib/assets/images/green_circle.svg"),
          ),
          Positioned(
            top: 404.h,
            left: 241.w,
            height: 48.h,
            width: 48.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE8EDDF),
              ),
            ),
          ),
          Positioned(
            top: 426.h,
            left: 340.w,
            height: 52.h,
            width: 52.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF7D984A),
              ),
            ),
          ),
          Positioned(
            top: 500.h,
            left: 278.w,
            height: 48.h,
            width: 48.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC6D2B0),
              ),
            ),
          ),
          Positioned(
            top: 469.h,
            left: 157.w,
            height: 55.h,
            width: 55.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4E7309),
              ),
            ),
          ),
          Positioned(
            top: 469.h,
            left: 32.w,
            height: 72.h,
            width: 72.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC6D2B0),
              ),
            ),
          ),
          Positioned(
            top: 590.h,
            left: 53.w,
            height: 48.h,
            width: 48.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xD17D984A),
              ),
            ),
          ),
          Positioned(
            top: 693.h,
            left: 15.w,
            height: 45.h,
            width: 45.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4E7309),
              ),
            ),
          ),
          Positioned(
            top: 706.h,
            left: 231.w,
            child: Text(
              "25%",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 64.sp,
                color: AppColors.white,
              ),
            ),
          ),
          Positioned(
            top: 784.h,
            left: 249.w,
            child: Text(
              "Stress Level",
              style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.white
              ),
            ),
          ),
        ],
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