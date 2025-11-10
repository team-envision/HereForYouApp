import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/AiChatBotScreen/data/ai_chat_bot_screen_datasource.dart';

import '../states/ai_chat_bot_screen_state.dart';

class AiChatBotScreenController extends GetxController {
  AiChatBotScreenState state;
  AiChatBotScreenDataSource dataSource;

  AiChatBotScreenController({required this.state, required this.dataSource});

  Future<void> onSend(ChatMessage message) async {
    state.messages.insert(0, message);
    state.isGeminiTyping.value = true;
    String? response = await dataSource.sendMessage(message.text);
    if (response != null) {
      ChatMessage responseMessage = ChatMessage(
        text: response,
        user: state.geminiUser,
        createdAt: DateTime.now(),
      );
      state.messages.insert(0, responseMessage);
    }
    state.isGeminiTyping.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    state.scrollController = ScrollController();
    KeyboardVisibilityController().onChange.listen((isVisible) {
      scrollToSpecificPosition();
    });
  }

  void scrollToSpecificPosition() {
    state.scrollController.jumpTo(
      state.scrollController.position.maxScrollExtent,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    state.scrollController.dispose();
    super.dispose();
  }
}
