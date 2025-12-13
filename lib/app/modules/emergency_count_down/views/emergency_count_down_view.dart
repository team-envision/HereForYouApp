import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../../../../common/Components/kElevatedButton.dart';
import '../controllers/emergency_count_down_controller.dart';

class EmergencyCountDownView extends GetView<EmergencyCountDownController> {
  const EmergencyCountDownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFFDADA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
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
          'Emergency',
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
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildRing(size: 341.02, color: const Color(0xFFFF6E6E)),
                _buildRing(size: 296.76, color: const Color(0xFFFD4B4B)),
                Container(
                  height: 260.32.h,
                  width: 260.32.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEF0101),
                    shape: BoxShape.circle,
                  ),
                  child: Obx(
                    () => controller.showString.value
                        ? Text(
                            "calling emergency contact number......",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 25.8.sp,
                              color: AppColors.white,
                              height: 1.0,
                            ),
                          )
                        : Text(
                            controller.count.value.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 193.38.sp,
                              color: AppColors.white,
                              height: 1.0,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50.h,
            left: 66.w,
            right: 66.w,
            child: SizedBox(
              height: 53.h,
              child: kElevatedButton(
                text: "Cancel",
                fontSize: 22.79.sp,
                onPressed: () => Get.back(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRing({required double size, required Color color}) {
    return Container(
      height: size.h,
      width: size.w,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
