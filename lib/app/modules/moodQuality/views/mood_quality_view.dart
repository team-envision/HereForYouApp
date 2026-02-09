import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/Components/bar_graph.dart';
import '../../../../resources/app_resources/app_colors.dart';
import '../controllers/mood_quality_controller.dart';

class MoodQualityView extends GetView<MoodQualityController> {
  const MoodQualityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEBC2),
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
          'Mood Quality',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w800,
            fontSize: 24.95.sp,
            letterSpacing: -0.3,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -150,
            left: 0,
            right: 0,
            height: 900.h,
            child: Image.asset("assets/images/mood_quality.png"),
          ),
          Positioned(
            left: 0,
            right: 0,
            height: 350.h,
            top: 539.h,
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(200.w, 30.h),
                  topRight: Radius.elliptical(200.w, 30.h),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35.h),
                  Text(
                    "Previous Results",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 20.sp,
                      letterSpacing: 2 / 100 * 20.sp,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: SizedBox(
                      height: 170.h,
                      child: Obx(
                        () => CustomGraph(
                          valueMapper: (data) => data.moodScore,
                          leftLabel: controller.emojis,
                          values: controller.results.value,
                          barColor: const Color(0xFF765A48),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 182.h,
            width: 230.w,
            height: 230.h,
            child: Image.asset("assets/images/smile_face.png"),
          ),
          Positioned(
            top: 447.h,
            child: Text(
              "Happy",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 29.7.sp,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
