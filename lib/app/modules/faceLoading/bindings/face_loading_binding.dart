import 'package:get/get.dart';

import '../controllers/face_loading_controller.dart';

class FaceLoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FaceLoadingController());
  }
}
