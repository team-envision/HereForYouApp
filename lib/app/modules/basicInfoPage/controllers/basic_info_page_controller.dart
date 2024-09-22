import 'package:get/get.dart';

class BasicInfoPageController extends GetxController {
  //TODO: Implement BasicInfoPageController

  var age = ''.obs;
  var weight = ''.obs;
  var height = ''.obs;


  bool get isNextEnabled => age.isNotEmpty && weight.isNotEmpty && height.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
