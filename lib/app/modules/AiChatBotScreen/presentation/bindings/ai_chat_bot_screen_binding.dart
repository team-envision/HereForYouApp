import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/AiChatBotScreen/data/ai_chat_bot_screen_datasource.dart';
import 'package:here_for_you_app/common/firebase/firebase_ai.dart';
import 'package:here_for_you_app/core/dio_client.dart';

import '../controllers/ai_chat_bot_screen_controller.dart';
import '../states/ai_chat_bot_screen_state.dart';

class AiChatBotScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiChatBotScreenController>(
      () => AiChatBotScreenController(
        state: AiChatBotScreenState(),
        dataSource: AiChatBotScreenDataSource(firebaseAI: FirebaseAi()),
      ),
    );
  }
}
