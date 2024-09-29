import 'dart:async';

import 'package:get/get.dart';

import '../../../views/views/mind_anchor_on_complete_view.dart';

class MindAnchorMainScreenController extends GetxController {
  //TODO: Implement MindAnchorMainScreenController

  late Timer _timer;
  RxInt currentIndex = 0.obs;
  RxInt remainingTime = 5.obs;

  // List of titles
  final List<String> titles = [
    "Observe 5 things that you can see around you.",
    "Observe 4 things that you can feel (touch) right now.",
    "Observe 3 things that you can hear in this moment.",
    "Observe 2 things that you can smell right now.",
    "Observe 1 thing that you can taste right now."
  ];

  // List of images
  final List<String> imagePaths = [
    'lib/assets/images/observer1.png',
    'lib/assets/images/observer2.png',
    'lib/assets/images/observer2.png',
    'lib/assets/images/observer4.png',
    'lib/assets/images/observer5.png',
  ];

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
          remainingTime--;
      } else {
        // Update the title and image
        if (currentIndex < titles.length - 1) {
            currentIndex++;
            remainingTime.value = 5;
        } else {
          _timer.cancel();
          Get.off(()=>MindAnchorOnCompleteView());
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

}
