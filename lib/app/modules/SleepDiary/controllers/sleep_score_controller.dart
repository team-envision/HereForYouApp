import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SleepScoreController extends GetxController {

  String Textdata = "According to our screening assessment you have symptoms "
      "suggestive of Depression. Sadness is a human emotion that all "
      "people feel at certain times during their lives. Feeling sad is a "
      "natural reaction to situations that cause emotional upset or pain. "
      "Depression differs from sadness. The feelings you have will affect "
      "all aspects of your life. Depression is a medical condition, not an emotion.";

  RxString _DepressionResult = ''.obs;
  RxString msg = "Please take a test to see the score".obs;
  RxString title = ''.obs;
  RxString endMsg = ''.obs;
  RxString imgUrl = 'lib/assets/images/brightsmile.png'.obs;
  RxString _StressResult = ''.obs;
  RxString _AnxietyResult = ''.obs;

  final ScrollController scrollController = ScrollController();

  RxBool isScrollingUp = false.obs;

  double previousScrollOffset = 0.0;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    getFinalMessage();
  }

  void scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      isScrollingUp.value = false;
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      isScrollingUp.value = true;
    }

    previousScrollOffset = scrollController.offset;
  }

  void getFinalMessage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _DepressionResult.value = prefs.getString("DepressionResult") ?? "None";
    _AnxietyResult.value = prefs.getString("AnxietyResult") ?? "None";
    _StressResult.value = prefs.getString("StressResult") ?? "None";

    print(_DepressionResult.value);
    print(_AnxietyResult.value);
    print(_StressResult.value);

    msg.value = "According to our screening assessment, we have identified the following:";
    endMsg.value = "";

    if (_DepressionResult.value == "Moderate" ||
        _DepressionResult.value == "Moderately severe" ||
        _DepressionResult.value == "Severe") {
      msg.value += "\n\n**Depression**: Symptoms suggestive of Depression have been identified.";
      endMsg.value +=
      "\nSadness is a natural human emotion, but depression differs. Depression is a medical condition, not just sadness.";
    }


    if (_AnxietyResult.value == "Moderate anxiety" ||
        _AnxietyResult.value == "Severe anxiety") {
      msg.value += "\n\n**Anxiety**: Symptoms suggestive of an Anxiety disorder have been identified.";
      endMsg.value +=
      "\nIt's normal to feel anxious, but it becomes a problem when symptoms are constant or intense, even without a present danger.";
    }


    if (_StressResult.value == "Moderate" ||
        _StressResult.value == "Severe" ||
        _StressResult.value == "Extremely Severe") {
      msg.value += "\n\n**Stress**: High stress levels that may be challenging to cope with have been identified.";
      endMsg.value +=
      "\nStress is natural and important for growth, but it becomes problematic when it exceeds your ability to cope.";
    }


    if (msg.value == "According to our screening assessment, we have identified the following:") {
      msg.value =
      "According to our screening assessment, you show no significant symptoms of depression, anxiety, or stress.";
      endMsg.value =
      "Strong mental health is more than the absence of mental health problems; it’s about the presence of positive characteristics.";
      title.value = "No Issues";
      imgUrl.value = "lib/assets/images/icon_noProblems.png";
    } else {
      title.value = "Assessment Results";
      imgUrl.value = "lib/assets/images/brightsmile.png";
    }
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(scrollListener);
  }
}
