import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/mentalScore/views/mental_score_view.dart';
import 'package:here_for_you_app/app/modules/moodQuality/views/mood_quality_view.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../Components/featureCards.dart';
import '../../../../Components/featureContainers.dart';
import '../../../views/views/MindAnchorView.dart';
import '../../SleepDiary/controllers/sleep_diary_controller.dart';
import '../../SleepDiary/views/sleepDiaryHomeView.dart';
import '../../SleepDiary/views/sleep_diary_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        backgroundColor: AppColors.appBarBg,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.avatarBg,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/avatar.png",
                  scale: 0.8,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            // CachedNetworkImage(
            //   imageUrl:
            //       "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png",
            //   progressIndicatorBuilder: (context, url, downloadProgress) =>
            //       CircularProgressIndicator(value: downloadProgress.progress),
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            //   height: 50,
            //   width: 50,
            // ),
            const SizedBox(width: 20),
            Text(
              "Hi, Priya!",
              style: Get.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                kCard(
                  backGroundColor: AppColors.mindTestBg,
                  borderColor: AppColors.mindTestBorder,
                  onTap: () {
                    Get.toNamed(Routes.MIND_TEST);
                  },
                  text: "Start Your\nMind Test",
                  IsSvg: true,
                  ImagePath: "assets/images/StartYourMindCard.svg",
                  iconPath: "assets/icons/BookIcon.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 15),
                  child: Text(
                    "Whats your mood today?",
                    style: GoogleFonts.urbanist(
                      fontSize: 14.86.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.moodBg,
                    border: Border.all(color: AppColors.moodBorder),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(controller.emojis.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value =
                              index; // update the selected emoji
                        },
                        child: Obx(
                          () => Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: controller.selectedIndex.value == index
                                  ? AppColors.moodSelected
                                  : AppColors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              controller.emojis[index],
                              style: Get.theme.textTheme.headlineLarge,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 15),
                  child: Text(
                    "Mental Health Analysis",
                    style: GoogleFonts.urbanist(
                      fontSize: 14.86.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                SizedBox(
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
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: kCard(
                    onTap: () => Get.toNamed(Routes.AI_CHAT_BOT_SCREEN),
                    backGroundColor: AppColors.aiChatBg,
                    borderColor: AppColors.aiChatBorder,
                    text: "Chat with\nA.I Bot",
                    IsSvg: false,
                    ImagePath: "assets/images/AiChatBotCard.png",
                    iconPath: 'assets/icons/roboIcon.png',
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: bottomNavigation(),
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
