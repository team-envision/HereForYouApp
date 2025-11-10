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
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.MAIN),
          icon: Image.asset(
            "assets/images/backward_arrow.png",
            height: 22.43.h,
            width: 17.5.w,
          ),
        ),
        title: Text(
          'Stress Level',
          style: GoogleFonts.urbanist(
            fontSize: 24.95.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
        centerTitle: true,
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
                child: Text(
                  "Stress Level: 80",
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
          Positioned(
            top: 696.h,
            left: 159.w,
            height: 76.h,
            width: 76.w,
            child: IconButton(
              icon: Image.asset("assets/images/greenButton.png"),
              onPressed: () => Get.offAllNamed(Routes.STRESS_LEVEL),
            ),
          ),
        ],
      ),
    );
  }
}
