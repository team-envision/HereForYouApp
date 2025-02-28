import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/app/modules/SleepDiary/views/sleepDiaryHomeView.dart';
import 'package:here_for_you_app/app/views/views/mind_anchor_begin_view.dart';

import '../controllers/sleep_diary_controller.dart';

class SleepDiaryView extends GetView<SleepDiaryController> {
  const SleepDiaryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sleep Diary"),
        titleTextStyle: Get.theme.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 32,
            )),

        leadingWidth: 90,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [

              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16.0),
                child: Text(
                  "Fill out the sleep diary daily, ideally within an hour of waking and before bed. Note anything that affects your sleep or wakefulness. If you miss a day, leave it blank. Exact times aren’t necessary—your best recall will do, and reflecting on your sleep won’t keep you awake.",
                  style: Get.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
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
              ),
              kElevatedButton(
                  text: "Start",
                  onPressed: () {
                    Get.off(() => const SleepDiaryHomeView());
                  }),
const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
