import 'package:get/get.dart';

class StressLevelState extends GetXState {
  RxInt stressScore = 80.obs;
  RxString analysis =
      "It looks like your stress levels are high. This can happen due to various factors like work, relationships, or life changes, and it’s important to take it seriously. High stress, if left unchecked, can affect your mental and physical well-being."
          .obs;
}
