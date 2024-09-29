import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MentalScoreController extends GetxController {
  //TODO: Implement MentalScoreController

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
    _DepressionResult.value = prefs.getString("DepressionResult")!;
    _AnxietyResult.value = prefs.getString("AnxietyResult")!;
    _StressResult.value = prefs.getString("StressResult")!;
    if (_DepressionResult.value == "Moderate" ||
        _DepressionResult.value == "Moderately severe" ||
        _DepressionResult.value == "Severe") {
      msg.value =
          "According to our screening assessment you have symptoms suggestive of Depression.";

      endMsg.value =
          "Sadness is a human emotion that all people feel at certain times during their lives."
          " Feeling sad is a natural reaction to situations that cause emotional upset or pain."
          " Depression differs from sadness. The feelings you have will affect all aspects of your life."
          " Depression is a medical condition, not an emotion.";
      title.value = "Depression";
      imgUrl.value = "lib/assets/images/icon_depression.png";
    } else if (_AnxietyResult.value == "Moderate anxiety" ||
        _AnxietyResult.value == "Severe anxiety") {
      msg.value =
          "According to our screening assessment you  may have symptoms suggestive of an Anxiety disorder.";

      endMsg.value =
          "It’s normal to feel Anxious when faced with a potentially dangerous situation or worrying triggers,"
          " our “nerves” become the warning signs we need to navigate the dangers around us."
          " The problem starts when you start experiencing  these symptoms constantly or intensely even without a present danger.";

      title.value = "Anxiety";
      imgUrl.value = "lib/assets/images/icon_anxiety.png";
    } else if (_StressResult.value == "Moderate" ||
        _StressResult.value == "Severe" ||
        _StressResult.value == "Extremely Severe") {
      msg.value =
          "Our screening assessment suggests that you may be under stress, which you’re unable to cope with.";

      endMsg.value =
          "We all go through stress in our lives, it’s important for your growth."
          " Stress becomes a problem when it exceeds your ability to cope with them.";

      title.value = "Stress";
      imgUrl.value = "lib/assets/images/icon_stress.png";
    } else {
      msg.value =
          "According to our screening assessment you don’t have any symptoms suggestive of depression, anxiety disorder or stress.";

      endMsg.value =
          "Strong mental health isn’t just the absence of mental health problems. Being mentally or emotionally healthy is much more than being free of depression, anxiety, or other psychological issues. Rather than the absence of mental illness, mental health refers to the presence of positive characteristics.";
      title.value = "No Issues";
      imgUrl.value = "lib/assets/images/icon_noProblems.png";
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
