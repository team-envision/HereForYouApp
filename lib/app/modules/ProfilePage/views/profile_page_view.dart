import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/common/Components/popUpMenu.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../common/Components/customPopup.dart';
import '../../../../common/Components/featureCards.dart';
import '../../../../common/Components/featureContainers.dart';
import '../../../../common/Components/kElevatedButton.dart';
import '../../../routes/app_pages.dart';
import '../../../views/views/MindAnchorView.dart';
import '../../mentalScore/views/mental_score_view.dart';
import '../../moodQuality/views/mood_quality_view.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            header(),
            Text(
              "Rhythm Gupta",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 24.95.sp,
                letterSpacing: 24.95.sp * 0.02,
              ),
            ),
            Text(
              "rhythm.gupta360@gmail.com",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 9.56.sp,
                letterSpacing: 9.56.sp * 0.02,
              ),
            ),
            SizedBox(height: 7.h),
            SizedBox(
              height: 24.87.h,
              width: 82.w,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.33.r),
                    side: const BorderSide(color: AppColors.black, width: 0.7),
                  ),
                ),
                onPressed: () => Get.toNamed(Routes.EDIT_PROFILE_VIEW),
                child: Text(
                  "Edit Details",
                  style: GoogleFonts.urbanist(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.65.sp,
                    letterSpacing: 0.02 * 10.65.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18.13.h),
            Container(
              width: double.infinity,
              height: 196.h,
              margin: EdgeInsets.only(left: 19.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Results",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.86.sp,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 147.w,
                          child: kContainer(
                            color: AppColors.mentalScoreCard,
                            text: "Mental\nScore",
                            onTap: () => Get.to(() => const MentalScoreView()),
                            icon: SvgPicture.asset(
                              "assets/icons/mentalScoreIcon.svg",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 147.w,
                          child: kContainer(
                            color: AppColors.mindAnchorCard,
                            text: "Mind\nAnchor",
                            onTap: () => Get.to(() => const Mindanchorview()),
                            icon: SvgPicture.asset(
                              "assets/icons/AnchorIcon.svg",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 147.w,
                          child: kContainer(
                            color: AppColors.moodQualityCard,
                            onTap: () => Get.to(() => const MoodQualityView()),
                            text: "Mood\nQuality",
                            icon: SvgPicture.asset(
                              "assets/icons/moodQulatiyIcon.svg",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 147.w,
                          child: kContainer(
                            color: AppColors.stressSecondary,
                            onTap: () => Get.toNamed(Routes.STRESS_INDICATOR),
                            text: "Stress\nLevel",
                            icon: stressLevel(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.13.h),

            SizedBox(
              height: 171.h,
              width: 355.w,
              child: kCard(
                onTap: () => Get.toNamed(Routes.EMERGENCY_COUNT_DOWN),
                backGroundColor: AppColors.profileCard4,
                borderColor: Colors.red,
                text: 'Emergency?',
                IsSvg: true,
                alignment: Alignment.centerRight,
                ImagePath: 'assets/images/emergencyCardImage.svg',
                iconPath: 'assets/icons/emergency.png',
                subText: "Click to Alert Now!",
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              height: 49.h,
              width: 355.w,
              child: kElevatedButton(
                text: "Logout",
                onPressed: () {
                  CustomPopup.show(
                    title: 'Are you sure want to logout?',
                    onCancel: () => Get.back(),
                    onAccept: controller.logout,
                  );
                },
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  // radial gauge widget
  Widget stressLevel() {
    return SizedBox(
      width: 400.23.w,
      height: 47.52.h,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            startAngle: 180,
            endAngle: 360,
            radiusFactor: 1.8,
            canScaleToFit: true,
            pointers: [
              MarkerPointer(
                value: 20,
                markerHeight: 15.47.h,
                markerWidth: 15.47.w,
                color: AppColors.white,
                markerType: MarkerType.circle,
              ),
            ],
            ranges: [
              GaugeRange(
                startValue: 0,
                endValue: 20,
                color: const Color(0xFFE0FFA5),
                startWidth: 10,
                endWidth: 10,
              ),
              GaugeRange(
                startValue: 20,
                endValue: 40,
                color: const Color(0xFFC7EA85),
                startWidth: 10,
                endWidth: 10,
              ),
              GaugeRange(
                startValue: 40,
                endValue: 60,
                color: const Color(0x214E7309),
                startWidth: 10,
                endWidth: 10,
              ),
              GaugeRange(
                startValue: 60,
                endValue: 80,
                color: const Color(0x524E7309),
                startWidth: 10,
                endWidth: 10,
              ),
              GaugeRange(
                startValue: 80,
                endValue: 100,
                color: const Color(0xFF4E7309),
                startWidth: 10,
                endWidth: 10,
              ),
            ],
            annotations: [
              GaugeAnnotation(
                positionFactor: 0,
                widget: Text(
                  "20%",
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 17.32.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget header() {
    return SizedBox(
      width: double.infinity,
      height: 300.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: ClipRRect(borderRadius: BorderRadius.circular(30.r),child: Image.asset("assets/images/profile_background.png")),
          ),
          Positioned(
            left: 20.41.w,
            top: 132.36.h,
            height: 52.07.h,
            width: 123.57.w,
            child: SvgPicture.asset("assets/images/profile_cloud.svg"),
          ),
          Positioned(
            left: 267.41.w,
            top: 70.36.h,
            height: 11.93.h,
            width: 28.23.w,
            child: SvgPicture.asset("assets/images/profile_cloud.svg"),
          ),
          Positioned(
            left: 267.41.w,
            top: 70.36.h,
            height: 11.93.h,
            width: 28.23.w,
            child: SvgPicture.asset("assets/images/profile_cloud.svg"),
          ),
          Positioned(
            left: 92.41.w,
            top: 56.36.h,
            height: 28.65.h,
            width: 67.79.w,
            child: SvgPicture.asset("assets/images/profile_cloud.svg"),
          ),
          Positioned(
            left: 275.41.w,
            top: 91.36.h,
            height: 59.97.h,
            width: 141.64.w,
            child: Transform.flip(
              flipX: true,
              child: SvgPicture.asset("assets/images/profile_cloud.svg"),
            ),
          ),
          Positioned(
            top: 172.36.h,
            height: 122.h,
            width: 122.w,
            child: Image.asset("assets/images/profile_image.png"),
          ),
          Positioned(
            top: 64.h,
            child: Text(
              "Profile",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 24.95.sp,
                letterSpacing: -0.3,
              ),
            ),
          ),
          Positioned(top: 53.h, left: 329.41.w, child: const MenuPopup()),
        ],
      ),
    );
  }
}
