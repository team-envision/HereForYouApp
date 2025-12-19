import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/moodQuality/views/mood_quality_view.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../common/Components/featureCards.dart';
import '../../../../common/Components/featureContainers.dart';
import '../../../views/views/MindAnchorView.dart';
import '../../SleepDiary/controllers/sleep_diary_controller.dart';
import '../../SleepDiary/views/sleepDiaryHomeView.dart';
import '../../SleepDiary/views/sleep_diary_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      body: Column(
        children: [
          header(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    kCard(
                      backGroundColor: AppColors.mindTestBg,
                      borderColor: AppColors.mindTestBorder,
                      onTap: () => Get.toNamed(Routes.QUESTION_COUNT_DOWN),
                      text: "Start Your\nMind Test",
                      IsSvg: true,
                      ImagePath: "assets/images/StartYourMindCard.svg",
                      iconPath: "assets/icons/BookIcon.png",
                    ),
                    _buildSectionTitle("Whats your mood today?"),
                    _buildMoodSelector(controller),
                    _buildSectionTitle("Mental Health Analysis"),
                    SizedBox(height: 171.h, child: _buildMentalHealthList()),
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
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.only(left: 22.w),
      height: 143.h,
      decoration: BoxDecoration(
        color: const Color(0xFFEEE5FF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(38.r),
          bottomRight: Radius.circular(38.r),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8C6CC9).withOpacity(0.89),
            offset: const Offset(0, 0),
            blurRadius: 14.4,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 17.83.h),
            child: Image.asset(
              'assets/images/profile_image.png',
              width: 59.14,
              height: 59.14,
            ),
          ),
          SizedBox(width: 14.86.w),
          Padding(
            padding: EdgeInsets.only(bottom: 28.h),
            child: Obx(
              () => Text(
                "Hi, ${controller.user.name}!",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.95.sp,
                  letterSpacing: 0.02 * 24.95.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 15),
      child: Text(
        title,
        style: GoogleFonts.urbanist(
          fontSize: 14.86.sp,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.3,
        ),
      ),
    );
  }

  Widget _buildMoodSelector(HomeController controller) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.moodBg,
        border: Border.all(color: AppColors.moodBorder),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Obx(() {
        final selectedIndex = controller.selectedIndex.value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            controller.emojis.length,
            (index) => _buildEmojiButton(
              emoji: controller.emojis[index],
              isSelected: selectedIndex == index,
              onTap: () => controller.selectedIndex.value = index,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildEmojiButton({
    required String emoji,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.moodSelected : AppColors.transparent,
          shape: BoxShape.circle,
        ),
        child: Text(emoji, style: Get.theme.textTheme.headlineLarge),
      ),
    );
  }

  Widget _buildMentalHealthList() {
    return ListView(
      itemExtent: 170,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        kContainer(
          color: AppColors.mentalScoreCard,
          text: "Mental\nscore",
          onTap: () => Get.toNamed(Routes.MENTAL_SCORE),
          icon: SvgPicture.asset("assets/icons/mentalScoreIcon.svg"),
        ),
        kContainer(
          color: AppColors.mindAnchorCard,
          text: "Mind\nAnchor",
          onTap: () => Get.to(() => const Mindanchorview()),
          icon: SvgPicture.asset("assets/icons/AnchorIcon.svg"),
        ),
        kContainer(
          color: AppColors.moodQualityCard,
          onTap: () => Get.to(() => const MoodQualityView()),
          text: "Mood\nQuality",
          icon: SvgPicture.asset("assets/icons/moodQulatiyIcon.svg"),
        ),
        kContainer(
          color: AppColors.stressSecondary,
          onTap: () => Get.toNamed(Routes.STRESS_INDICATOR),
          text: "Stress\nLevel",
          icon: const StressLevelGauge(),
        ),
        kContainer(
          color: AppColors.mentalScoreCard,
          onTap: _handleSleepDiaryTap,
          text: "Sleep\nDiary",
          icon: SvgPicture.asset("assets/icons/sleepdiaryicon.svg"),
        ),
      ],
    );
  }

  void _handleSleepDiaryTap() async {
    final sleepController = Get.find<SleepDiaryController>();
    final hasSetReminder = await sleepController.hasSetReminder();

    if (hasSetReminder) {
      Get.to(() => SleepDiaryHomeView());
    } else {
      Get.to(() => SleepDiaryView());
    }
  }
}

class StressLevelGauge extends StatelessWidget {
  const StressLevelGauge({super.key});

  @override
  Widget build(BuildContext context) {
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
