import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/featureContainers.dart';
import '../../../../Components/featureCards.dart';
import '../../../../Components/popUpMenu.dart';
import '../../editProfileView/views/edit_profile_view.dart';
import '../../mentalScore/views/mental_score_view.dart';
import '../../moodQuality/views/mood_quality_view.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      color: Color.fromRGBO(235, 255, 196, 1),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(350, 200))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 32.0,
                    ),
                    child: SvgPicture.asset(
                      "lib/assets/images/clouds.svg",
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
                          backgroundColor:
                              const Color.fromRGBO(155, 131, 200, 1),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              "lib/assets/images/avatar.png",
                              alignment: Alignment.bottomCenter,
                              scale: 0.8,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Rhythm Gupta",
                          style: Get.textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
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
                                        vertical: 0, horizontal: 7)),
                              ),
                              child: const Text(
                                "Edit Details",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.1,
                        ),
                        Text(
                          "Profile",
                          style: Get.textTheme.headlineSmall
                              ?.copyWith(fontSize: 23),
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                                builder: (BuildContext context) {
                                  return const MenuPopup(); // The custom menu popup
                                },
                              );
                            },
                            icon: const Icon(Icons.menu))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.2,
          ),
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
                      style: Get.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        itemExtent: 170,
                        scrollDirection: Axis.horizontal,
                        children: [
                          kContainer(
                              color: const Color.fromRGBO(118, 90, 72, 1),
                              text: "Mental\nScore",
                              onTap: (){  Get.to(() => const MentalScoreView());},
                              icon: SvgPicture.asset(
                                  "lib/assets/icons/mentalScoreIcon.svg")),
                          kContainer(
                              color: const Color.fromRGBO(140, 108, 201, 1),
                              text: "Mind\nAnchor",
                              icon: SvgPicture.asset(
                                  "lib/assets/icons/AnchorIcon.svg")),
                          kContainer(
                              color: const Color.fromRGBO(255, 148, 76, 1),
                              text: "Mood\nQuality",
                              onTap: () {Get.to(()=>const MoodQualityView());},
                              icon: SvgPicture.asset(
                                  "lib/assets/icons/moodQulatiyIcon.svg")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: kCard(
                            backGroundColor:
                                const Color.fromRGBO(255, 216, 193, 1),
                            borderColor: Colors.red,
                            text: 'Emergency?',
                            IsSvg: true,
                            alignment: Alignment.centerRight,
                            ImagePath:
                                'lib/assets/images/emergencyCardImage.svg',
                            iconPath: 'lib/assets/icons/emergency.png',
                            subText: "Click to Alert Now!"),
                      )),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
