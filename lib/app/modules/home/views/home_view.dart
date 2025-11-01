import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/SleepDiary/views/eveningview_view.dart';

import 'package:here_for_you_app/app/modules/mentalScore/views/mental_score_view.dart';
import 'package:here_for_you_app/app/modules/moodQuality/views/mood_quality_view.dart';
import 'package:here_for_you_app/app/modules/stressLevel/views/stress_level_view.dart';
import 'package:here_for_you_app/app/views/views/mind_test_view.dart';
import '../../../../Components/featureCards.dart';
import '../../../../Components/featureContainers.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import '../../../views/views/MindAnchorView.dart';
import '../../AiChatBotScreen/views/ai_chat_bot_screen_view.dart';
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
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22))),
        backgroundColor: AppColors.appBarBg,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.avatarBg,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "lib/assets/images/avatar.png",
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
            const SizedBox(
              width: 20,
            ),
            Text("Hi, Priya!",
                style: Get.theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600))
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
                      Get.to(() => const MindTestScreenView());
                    },
                    text: "Start Your\nMind Test",
                    IsSvg: true,
                    ImagePath: "lib/assets/images/StartYourMindCard.svg",
                    iconPath: "lib/assets/icons/BookIcon.png"),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 15),
                  child: Text(
                    "Whats your mood today?",
                    style: Get.theme.textTheme.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.moodBg,
                        border: Border.all(
                            color: AppColors.moodBorder),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          List.generate(controller.emojis.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectedIndex.value =
                                index; // update the selected emoji
                          },
                          child: Obx(() => Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == index
                                      ? AppColors.moodSelected
                                      : AppColors.transparent,
                                  shape: BoxShape
                                      .circle,
                                ),
                                child: Text(
                                  controller.emojis[index],
                                  style: Get.theme.textTheme.headlineLarge,
                                ),
                              )),
                        );
                      }),
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 15),
                  child: Text(
                    "Mental Health Analysis",
                    style: Get.theme.textTheme.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: ListView(
                    itemExtent: 170,
                    scrollDirection: Axis.horizontal,
                    children: [
                      kContainer(
                          color: AppColors.mentalScoreCard,
                          text: "Mental\nScore",
                          onTap: () {
                            Get.to(() => const MentalScoreView());
                          },
                          icon: SvgPicture.asset(
                              "lib/assets/icons/mentalScoreIcon.svg")),
                      kContainer(
                          color: AppColors.mindAnchorCard,
                          text: "Mind\nAnchor",
                          onTap: () {Get.to(()=>const Mindanchorview());},
                          icon: SvgPicture.asset(
                              "lib/assets/icons/AnchorIcon.svg")),
                      kContainer(
                          color: AppColors.moodQualityCard,
                          onTap: () {Get.to(()=>const MoodQualityView());},
                          text: "Mood\nQuality",
                          icon: SvgPicture.asset(
                              "lib/assets/icons/moodQulatiyIcon.svg")),
                      kContainer(
                          color: AppColors.stressSecondary,
                          onTap: () {Get.to(()=>const StressLevelView());},
                          text: "Stress\nLevel",
                          icon: SvgPicture.asset(
                              "lib/assets/icons/moodQulatiyIcon.svg")),
                      kContainer(
                          color: AppColors.mentalScoreCard,

                          onTap: () async {
                            final sleepcontroller = Get.put(SleepDiaryController());
                            bool hasSetReminder = await sleepcontroller.hasSetReminder();
                            if (hasSetReminder){
                              Get.to(SleepDiaryHomeView());
                            } else {
                              Get.to(SleepDiaryView());
                            }
                            },

                          text: "Sleep Diary\nQuality",
                          icon: SvgPicture.asset(
                              "lib/assets/icons/sleepdiaryicon.svg")),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: kCard(
                      onTap: () {
                      Get.to(()=>const AiChatBotScreenView());
                      },
                      backGroundColor: AppColors.aiChatBg,
                      borderColor: AppColors.aiChatBorder,
                      text: "Chat with\nA.I Bot",
                      IsSvg: false,
                      ImagePath: "lib/assets/images/AiChatBotCard.png",
                      iconPath: 'lib/assets/icons/roboIcon.png'),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: bottomNavigation(),
    );
  }
}
