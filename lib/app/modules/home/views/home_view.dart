import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22))),
        backgroundColor: Color.fromRGBO(238, 229, 255, 1),
        title: Row(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 50,
              width: 50,
            ),
            SizedBox(
              width: 20,
            ),
            Text("Hi, Rhythm Gupta!",style: Get.theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w600))
          ],
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(future: DefaultAssetBundle.of(context).loadString("lib/assets/json/questions.json"), builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(child: Text("Something Went Wrong"));
        }
        else{
          if(snapshot.hasData){
            if(snapshot.connectionState == ConnectionState.active){
              var data = snapshot.data;
              return  Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        kCard(backGroundColor: Color.fromRGBO(223, 242, 186, 1), borderColor: Color.fromRGBO(177, 212, 114, 1), text: "Start Your\nMind Test", IsSvg: true,ImagePath: "lib/assets/images/StartYourMindCard.svg",iconPath: "lib/assets/icons/BookIcon.png"),



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
                                color: Color.fromRGBO(255, 241, 193, 1),
                                border:
                                Border.all(color: Color.fromRGBO(255, 218, 95, 1)),
                                borderRadius: BorderRadius.circular(50)),
                            child:   Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(controller.emojis.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectedIndex.value = index; // update the selected emoji
                                  },
                                  child: Obx(() => Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: controller.selectedIndex.value == index ? Colors.yellow : Colors.transparent,
                                      shape: BoxShape.circle, // make the background circular
                                    ),
                                    child: Text(
                                      controller.emojis[index],
                                      style: Get.theme.textTheme.headlineLarge,
                                    ),
                                  )),
                                );
                              }),
                            )
                        ),
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
                                  color: Color.fromRGBO(118, 90, 72, 1),
                                  text: "Mental\nScore",
                                  icon: SvgPicture.asset(
                                      "lib/assets/icons/mentalScoreIcon.svg")),
                              kContainer(
                                  color: Color.fromRGBO(140, 108, 201, 1),
                                  text: "Mind\nAnchor",
                                  icon: SvgPicture.asset(
                                      "lib/assets/icons/AnchorIcon.svg")),
                              kContainer(
                                  color: Color.fromRGBO(255, 148, 76, 1),
                                  text: "Mood\nQuality",
                                  icon: SvgPicture.asset(
                                      "lib/assets/icons/moodQulatiyIcon.svg")),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: kCard(backGroundColor: Color.fromRGBO(229, 229, 228, 1), borderColor: Color.fromRGBO(131, 131, 131, 1), text: "Chat with\nA.I Bot", IsSvg: false,ImagePath: "lib/assets/images/AiChatBotCard.png", iconPath: 'lib/assets/icons/roboIcon.png'),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }
          return Center(child: CircularProgressIndicator());
        }
      },),
    );
  }

  Widget kContainer(
      {required Color color, required String text, required Widget icon}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(22)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              text,
              style: Get.theme.textTheme.titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          icon
        ],
      ),
    );
  }

  Widget kCard({required Color backGroundColor,required Color borderColor,required String text, required bool IsSvg,required String ImagePath,required String iconPath}){
    return  Container(
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: backGroundColor,
          border:
          Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(22)),
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                style: Get.theme.textTheme.titleLarge?.copyWith(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           IsSvg? SvgPicture.asset(
             ImagePath!,
              alignment: Alignment(2, 1),
            ) : Image.asset(ImagePath!,alignment: Alignment(2, 1),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                iconPath,
                alignment: Alignment.bottomLeft,
              ),
            ),
          ]),
    );
  }
}
