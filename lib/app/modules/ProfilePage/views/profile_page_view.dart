import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/customPopup.dart';
import 'package:here_for_you_app/Components/featureContainers.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/Components/popUpMenu.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../Components/featureCards.dart';
import '../../../views/views/MindAnchorView.dart';
import '../../SleepDiary/controllers/sleep_diary_controller.dart';
import '../../SleepDiary/views/sleepDiaryHomeView.dart';
import '../../SleepDiary/views/sleep_diary_view.dart';
import '../../editProfileView/views/edit_profile_view.dart';
import '../../mentalScore/views/mental_score_view.dart';
import '../../moodQuality/views/mood_quality_view.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
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
                Positioned(
                  bottom: -150,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: AppColors.avatarBg,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            "assets/images/avatar.png",
                            alignment: Alignment.bottomCenter,
                            scale: 0.8,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Rhythm Gupta",
                        style: Get.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text("rhythm.gupta360@gmail.com"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30,
                          child: OutlinedButton(
                            onPressed: () {
                              Get.to(() => EditProfile());
                            },
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 7,
                                ),
                              ),
                            ),
                            child: const Text(
                              "Edit Details",
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: Get.width * 0.1),
                        Text(
                          "Profile",
                          style: Get.textTheme.headlineSmall?.copyWith(
                            fontSize: 23,
                          ),
                        ),
                        MenuPopup(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height * 0.2),
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          text: "Mental\nscore",
                          onTap: () {
                            Get.to(() => const MentalScoreView());
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/mentalScoreIcon.svg",
                          ),
                        ),
                        kContainer(
                          color: AppColors.mindAnchorCard,
                          text: "Mind\nAnchor",
                          onTap: () {
                            Get.to(() => const Mindanchorview());
                          },
                          icon: SvgPicture.asset("assets/icons/AnchorIcon.svg"),
                        ),
                        kContainer(
                          color: AppColors.moodQualityCard,
                          onTap: () {
                            Get.to(() => const MoodQualityView());
                          },
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
                              Get.to(SleepDiaryHomeView());
                            } else {
                              Get.to(SleepDiaryView());
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
                  SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: kCard(
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
                  SizedBox(height: 8.h),
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
                          onAccept: () => Get.offAllNamed(Routes.GET_STARTED),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
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
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
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
                color: Color(0xFFE0FFA5),
                startWidth: 10,
                // Add this
                endWidth: 10, // Add this
              ),
              GaugeRange(
                startValue: 20,
                endValue: 40,
                color: Color(0xFFC7EA85),
                startWidth: 10,
                // Add this
                endWidth: 10, // Add this
              ),
              GaugeRange(
                startValue: 40,
                endValue: 60,
                color: Color(0x214E7309),
                startWidth: 10,
                // Add this
                endWidth: 10, // Add this
              ),
              GaugeRange(
                startValue: 60,
                endValue: 80,
                color: Color(0x524E7309),
                startWidth: 10,
                // Add this
                endWidth: 10, // Add this
              ),
              GaugeRange(
                startValue: 80,
                endValue: 100,
                color: Color(0xFF4E7309),
                startWidth: 10,
                // Add this
                endWidth: 10, // Add this
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
