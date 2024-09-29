import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../Components/kElevatedButton.dart';
import '../controllers/question_count_down_controller.dart';



class QuestionCountdownView extends GetView {
   QuestionCountdownView({super.key});
final controller = Get.put(QuestionCountDownController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
          child: SingleChildScrollView(
            child: SizedBox(height: Get.height-Get.statusBarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "lib/assets/images/ClockImage.svg",
                  ),
                  Padding(
                    padding: const EdgeInsets.all( 5.0),
                    child: Text(
                      // " ${controller.CurrentPage.value.toString()} Down ${controller.TotalPage.value.toString()} more to go!",
                      " Few More To Go!",
                      style: Get.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextPortion(nextPage: Get.arguments["next"]??"SDRS"),
                  ),
                  const Spacer(),
                  Wrap(
                    runSpacing: 10,
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
                                  "Select how often you’ve been bothered\nby these problems in the last 2 weeks.")
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: kElevatedButton(text: "Start", onPressed: () {controller.handleNavigation();}),
                      ),

                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class TextPortion extends StatelessWidget {
  TextPortion({
    required this.nextPage,
  }) ;
   String nextPage;


  @override
  Widget build(BuildContext context) {
    if(nextPage==""){
      nextPage="SDRS";
    }
    if (nextPage == "GAD7") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "To help us screen for Anxiety Disorder.(Keep in mind, this is just a screening test!)",
              style: Get.textTheme.titleMedium,
              textAlign: TextAlign.center,),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Select over the last 2 weeks, how often have you been bothered by the following problems.",
              style: Get.textTheme.titleMedium,
              textAlign: TextAlign.center,),
            const SizedBox(height: 8),
          ],
        ),
      );
    } else if (nextPage == "PHQ9") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height / 20),
            Text(
              "To help us screen for Depression.(Keep in mind, this is just a screening test!)",
              style: Get.textTheme.titleMedium,
              textAlign: TextAlign.justify,),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Select over the last 2 weeks, how often have you been bothered by the following problems.",
              style: Get.textTheme.titleMedium,
              textAlign: TextAlign.center,),
          ],
        ),
      );
    } else if (nextPage == "SDRS") {
      return Column(mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: "Select",
                style: Get.textTheme.titleMedium,),
              TextSpan(
                text: " how much the following statements apply to you, ",
                style: Get.textTheme.titleMedium,),
              TextSpan(
                text: "this will help us understand you better.",
                style: Get.textTheme.titleMedium,
              ),
            ]),
          ),
        ],
      );
    } else if (nextPage == "BACE") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Text(
              "Next, you will see a list of things that can stop, delay, or discourage people from getting professional care for a mental health problem, or continuing to get help. By professional care, we mean care from staff such as a GP (family doctor), member of a community mental health team (e.g. care coordinator, mental health nurse or mental health social worker), psychiatrist, counselor, psychologist, or psychotherapist.",
              style: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            Text(
              "Answer the following questions in accordance to the extent up to which any of these issues ever stopped, delayed, or discouraged you from getting, or continuing with, professional care for a mental health problem?",
              style: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            Text(
              "Reference:\nBarriers to Care Evaluation (BACE-3) scale © 2011. Health Service and Population Research Department, Institute of Psychiatry, King’s College London.",
              style: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}