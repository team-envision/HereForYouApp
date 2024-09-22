import 'package:get/get.dart';

import '../controllers/ai_chat_bot_screen_controller.dart';

class AiChatBotScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiChatBotScreenController>(
      () => AiChatBotScreenController(),
    );
  }
}
