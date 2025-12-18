import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/stressLevel/widgets/custom_circle.dart';
import 'package:here_for_you_app/app/modules/stressLevel/widgets/custom_heading.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/stress_level_controller.dart';

class StressLevelView extends GetView<StressLevelController> {
  const StressLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: IconButton(
            icon: Image.asset(
              "assets/images/backward_arrow.png",
              width: 34.18.w,
              height: 29.91.h,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Stress Level',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w800,
            fontSize: 24.95.sp,
            letterSpacing: -0.3,
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
                color: AppColors.stressBgLight,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHeading(reading: "(0-40) - ", label: "Low"),
                  CustomHeading(reading: "(41-70) - ", label: "Medium"),
                  CustomHeading(reading: "(71-100) - ", label: "High"),
                ],
              ),
            ),
          ),
          Positioned(
            width: 364.35.w,
            top: 203.21.h,
            left: 13.65.w,
            child: Obx(
              () => Text(
                textAlign: TextAlign.center,
                "Your Stress Level: ${controller.resultModel.value.getTodayScore().stressScore}/100 ",
                style: GoogleFonts.urbanist(
                  fontSize: 28.34.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.01 * 28.34.sp,
                  color: AppColors.stressPrimary,
                ),
              ),
            ),
          ),
          Positioned(
            top: 253.h,
            left: 26.w,
            width: 341.w,
            height: 110.h,
            child: Obx(
              () => Text(
                textAlign: TextAlign.center,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                controller.resultModel.value.getTodayScore().stressScore == 0
                    ? "Either you have not taken the test yet or you have no stress"
                    : controller.resultModel.value.stressRecommendation,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.91,
                  letterSpacing: 0.01 * 13.91.sp,
                ),
              ),
            ),
          ),
          Positioned(
            top: 595.h,
            left: 129.w,
            height: 341.02.h,
            width: 328.w,
            child: const Stack(
              alignment: Alignment.center,
              children: [
                Circle(radius: 328, color: AppColors.stressCircleTransparent),
                Circle(
                  radius: 296.76,
                  color: AppColors.stressCircleSemiTransparent,
                ),
                Circle(radius: 260.32, color: AppColors.stressPrimary),
              ],
            ),
          ),
          PositionedCircle(
            top: 404.h,
            left: 241.w,
            radius: 48,
            color: AppColors.stressBgLight,
          ),
          PositionedCircle(
            top: 426.h,
            left: 340.w,
            radius: 52,
            color: AppColors.stressSecondary,
          ),
          PositionedCircle(
            top: 500.h,
            left: 278.w,
            radius: 48,
            color: AppColors.stressLight,
          ),
          PositionedCircle(
            top: 469.h,
            left: 157.w,
            radius: 55,
            color: AppColors.stressPrimary,
          ),
          PositionedCircle(
            top: 469.h,
            left: 32.w,
            radius: 72,
            color: AppColors.stressLight,
          ),
          PositionedCircle(
            top: 590.h,
            left: 53.w,
            radius: 48,
            color: AppColors.stressSecondaryTransparent,
          ),
          PositionedCircle(
            top: 693.h,
            left: 15.w,
            radius: 45,
            color: AppColors.stressPrimary,
          ),
          Positioned(
            top: 706.h,
            left: 231.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${controller.resultModel.value.getTodayScore().stressScore}%",
                  style: GoogleFonts.urbanist(
                    fontSize: 64.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    height: 1,
                  ),
                ),
                Text(
                  "Stress Level",
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
