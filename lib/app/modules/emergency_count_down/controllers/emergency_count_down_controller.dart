import 'dart:async';

import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/emergency_count_down/data/emergency_count_down_data_sources.dart';
import 'package:here_for_you_app/common/utils/helpers.dart';
import 'package:logger/logger.dart';

class EmergencyCountDownController extends GetxController {
  EmergencyCountDownDataSources dataSources;

  EmergencyCountDownController({required this.dataSources});

  final count = 3.obs;
  RxBool showString = false.obs;
  String number = "100";
  Logger logger = Logger();

  Timer? timer;

  @override
  void onReady() {
    super.onReady();
    getData();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count.value > 0) {
        count.value--;
      } else {
        timer.cancel();
        initiateCall();
      }
    });
  }

  Future<void> initiateCall() async {
    showString.value = true;
    Helpers.openUrl(url: "tel:$number");
    Get.back();
  }

  Future<void> getData() async {
    final result = await dataSources.getDetails();
    result.fold((error) {}, (details) {
      number = details.number;
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
