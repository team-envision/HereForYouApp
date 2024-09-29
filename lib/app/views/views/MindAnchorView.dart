import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/DASS21_question_screen_view.dart';

import 'mind_anchor_begin_view.dart';

class Mindanchorview extends GetView {
  const Mindanchorview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 32,
            )),
        leadingWidth: 90,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "lib/assets/images/ClockImage.svg",
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "When shall I use these\nMindfulness practices?",
                  style: Get.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "These practices help you take quick \nbreaks, ease stress, calm anger or \nfear, reflect before acting, refocus, \nand make better choices\nhroughout the day..",
                  style: Get.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              kElevatedButton(text: "Start", onPressed: () {Get.off(()=>MindAnchorBeginView());}),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
