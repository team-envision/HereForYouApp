import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kBottomBar.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';

class MindAnchorOnCompleteView extends GetView {
  const MindAnchorOnCompleteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("lib/assets/images/mindAnchorComplete.png",scale: 1.7,),
          const SizedBox(
            height: 20,
          ),
           Text(
            "Congrats, you’ve officially\nanchored your mind!\nNow you can chill, refocus, and\nmake better choices all day.\nKeep it up and watch that stress melt\naway!",
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold,fontSize: 20),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: SizedBox(
              child: kElevatedButton(
                  text: "Go Home",
                  onPressed: () {
                    Get.offAll( bottomNavigation());
                  }),
            ),
          )
        ],
      )),
    );
  }
}
