import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../common/Components/customPopup.dart';
import '../../../../common/Components/featureCards.dart';
import '../../../../common/Components/featureContainers.dart';
import '../../../../common/Components/kElevatedButton.dart';
import '../../../../common/Components/popUpMenu.dart';
import '../../../views/views/MindAnchorView.dart';
import '../../SleepDiary/controllers/sleep_diary_controller.dart';
import '../../SleepDiary/views/sleepDiaryHomeView.dart';
import '../../SleepDiary/views/sleep_diary_view.dart';
import '../../editProfileView/presentation/views/edit_profile_view.dart';
import '../../mentalScore/views/mental_score_view.dart';
import '../../moodQuality/views/mood_quality_view.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER + AVATAR STACK
            Stack(
              clipBehavior: Clip.none,
              children: [
                // background curved container
                Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    color: AppColors.profileBg,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(350, 200),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: SvgPicture.asset(
                      "assets/images/clouds.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Top title row
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 30),
                      Text(
                        "Profile",
                        style: Get.textTheme.headlineSmall?.copyWith(
                          fontSize: 23,
                          color: AppColors.black,
                        ),
                      ),
                      const MenuPopup(),
                    ],
                  ),
                ),

                // Avatar + Info
                Positioned(
                  bottom: -120,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: AppColors.avatarBg,
                        child: Image.asset(
                          "assets/images/avatar.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Rhythm Gupta",
                        style: Get.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "rhythm.gupta360@gmail.com",
                        style: TextStyle(color: Colors.black54),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 34.h,
                          child: OutlinedButton(
                            onPressed: () {
                              // print("Edit Details button pressed ");
                              Get.to(() => EditProfileView());
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10,
                              ),
                              side: BorderSide(color: AppColors.black),
                            ),
                            child: const Text(
                              "Edit Details",
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 130),

            // MAIN CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recent Results header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Recent Results",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // Horizontal card scroll
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      height: 171.h,
                      child: ListView(
                        itemExtent: 170,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          kContainer(
                            color: AppColors.mentalScoreCard,
                            text: "Mental\nScore",
                            onTap: () => Get.to(() => const MentalScoreView()),
                            icon: SvgPicture.asset(
                              "assets/icons/mentalScoreIcon.svg",
                            ),
                          ),
                          kContainer(
                            color: AppColors.mindAnchorCard,
                            text: "Mind\nAnchor",
                            onTap: () => Get.to(() => const Mindanchorview()),
                            icon: SvgPicture.asset(
                              "assets/icons/AnchorIcon.svg",
                            ),
                          ),
                          kContainer(
                            color: AppColors.moodQualityCard,
                            onTap: () => Get.to(() => const MoodQualityView()),
                            text: "Mood\nQuality",
                            icon: SvgPicture.asset(
                              "assets/icons/moodQulatiyIcon.svg",
                            ),
                          ),
                          kContainer(
                            color: AppColors.stressSecondary,
                            onTap: () => Get.toNamed(Routes.STRESS_INDICATOR),
                            text: "Stress\nLevel",
                            icon: stressLevel(),
                          ),
                          kContainer(
                            color: AppColors.mentalScoreCard,
                            onTap: () async {
                              final sleepcontroller = Get.put(
                                SleepDiaryController(),
                              );
                              bool hasSetReminder = await sleepcontroller
                                  .hasSetReminder();
                              if (hasSetReminder) {
                                Get.to(() => const SleepDiaryHomeView());
                              } else {
                                Get.to(() => const SleepDiaryView());
                              }
                            },
                            text: "Sleep\nDiary",
                            icon: SvgPicture.asset(
                              "assets/icons/sleepdiaryicon.svg",
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Emergency card
                    SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
                    ),

                    // Logout button
                    Container(
                      width: double.infinity,
                      height: 55.h,
                      margin: EdgeInsets.symmetric(horizontal: 28.w),
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
                  ],
                ),
              ),
            ),
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
}
