import 'package:get/get.dart';

import '../controllers/feed_back_controller.dart';

class FeedBackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedBackController>(
      () => FeedBackController(),
    );
  }
}
