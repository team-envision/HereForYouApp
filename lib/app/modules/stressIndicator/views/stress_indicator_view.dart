import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/stress_indicator_controller.dart';

class StressIndicatorView extends GetView<StressIndicatorController> {
  const StressIndicatorView({super.key});

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
            top: 198.h,
            left: 47.w,
            height: 319.h,
            width: 301.w,
            child: Image.asset("assets/images/stressHead.png"),
          ),
          Positioned(
            top: 566.h,
            left: 60.w,
            height: 66.h,
            width: 274.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56.r),
                color: Color.fromRGBO(78, 115, 9, 1),
              ),
              child: Center(
                child: Obx(
                  () => Text(
                    "Stress Level: ${controller.resultModel.value.getTodayScore().stressScore}",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 28.34.sp,
                      letterSpacing: 0.01 * 28.34.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 696.h,
            left: 159.w,
            height: 76.h,
            width: 76.w,
            child: IconButton(
              icon: Image.asset("assets/images/greenButton.png"),
              onPressed: () => Get.offNamed(Routes.STRESS_LEVEL),
            ),
          ),
        ],
      ),
    );
  }
}
