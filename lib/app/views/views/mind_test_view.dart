import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/DASS21_question_screen_view.dart';

class MindTestScreenView extends GetView {
  const MindTestScreenView({super.key});
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Kudos on taking a step towards\nimproving your mental health!",
                  style: Get.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Before you start answering the Questions,\nRead each statement and\nselect based on how much the\nstatement applied to you over the past\nweek.",
                  style: Get.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Wrap(
                runSpacing: 16,
                children: [
                  Text.rich(
                    TextSpan(
                        text: "Note:",
                        style: Get.textTheme.labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              style: Get.textTheme.labelLarge,
                              text:
                                  "There are no right or wrong answers.\nAnswer honestly without overthinking..")
                        ]),
                  ),
                  kElevatedButton(text: "Start", onPressed: () {Get.off(()=>DASS21QuestionView());})
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
