import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kBottomBar.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/question_screen_view.dart';
import 'package:here_for_you_app/app/modules/mentalScore/views/mental_score_view.dart';
import 'package:here_for_you_app/app/views/views/mind_test_screen_view.dart';

import '../../../../Components/featureCards.dart';
import '../../../../Components/featureContainers.dart';
import '../../AiChatBotScreen/views/ai_chat_bot_screen_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22))),
        backgroundColor: const Color.fromRGBO(238, 229, 255, 1),
        title: Row(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 50,
              width: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            Text("Hi, Rhythm Gupta!",
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
                    backGroundColor: const Color.fromRGBO(223, 242, 186, 1),
                    borderColor: const Color.fromRGBO(177, 212, 114, 1),
                    onTap: () {
                      Get.to(() => MindTestScreenView());
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
                        color: const Color.fromRGBO(255, 241, 193, 1),
                        border: Border.all(
                            color: const Color.fromRGBO(255, 218, 95, 1)),
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
                                      ? Colors.yellow
                                      : Colors.transparent,
                                  shape: BoxShape
                                      .circle, // make the background circular
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
                          color: const Color.fromRGBO(118, 90, 72, 1),
                          text: "Mental\nScore",
                          onTap: () {
                            Get.to(() => MentalScoreView());
                          },
                          icon: SvgPicture.asset(
                              "lib/assets/icons/mentalScoreIcon.svg")),
                      kContainer(
                          color: const Color.fromRGBO(140, 108, 201, 1),
                          text: "Mind\nAnchor",
                          icon: SvgPicture.asset(
                              "lib/assets/icons/AnchorIcon.svg")),
                      kContainer(
                          color: const Color.fromRGBO(255, 148, 76, 1),
                          onTap: () {},
                          text: "Mood\nQuality",
                          icon: SvgPicture.asset(
                              "lib/assets/icons/moodQulatiyIcon.svg")),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: kCard(
                      onTap: () {
                      Get.to(()=>AiChatBotScreenView());
                      },
                      backGroundColor: const Color.fromRGBO(229, 229, 228, 1),
                      borderColor: const Color.fromRGBO(131, 131, 131, 1),
                      text: "Chat with\nA.I Bot",
                      IsSvg: false,
                      ImagePath: "lib/assets/images/AiChatBotCard.png",
                      iconPath: 'lib/assets/icons/roboIcon.png'),
                ),
                SizedBox(
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
