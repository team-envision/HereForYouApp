import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MentalScoreController extends GetxController {
  //TODO: Implement MentalScoreController

  String Textdata = "According to our screening assessment you have symptoms "
      "suggestive of Depression. Sadness is a human emotion that all "
      "people feel at certain times during their lives. Feeling sad is a "
      "natural reaction to situations that cause emotional upset or pain. "
      "Depression differs from sadness. The feelings you have will affect "
      "all aspects of your life. Depression is a medical condition, not an emotion.";


  final ScrollController scrollController = ScrollController();

  RxBool isScrollingUp = false.obs;


  double previousScrollOffset = 0.0;

  void scrollListener() {
    if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
      isScrollingUp.value = false;
    } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      isScrollingUp.value = true;
    }

    previousScrollOffset = scrollController.offset;
  }



  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
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
