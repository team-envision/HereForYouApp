import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class AiChatBotScreenController extends GetxController {
  //TODO: Implement AiChatBotScreenController

  String Textdata = "Our AI Chatbot is here to help you navigate "
      "through mental health challenges with instant "
      "support, guidance, and resources. Whether "
      "you’re feeling stressed, anxious, or just need "
      "someone to talk to, our AI is ready to listen and "
      "provide helpful insights.";


  final gemini = Gemini.instance;
  var scrollController;
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  ChatUser user = ChatUser(
    id: '0',
    firstName: 'User',
  );

  final ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'MentAid',
    profileImage: "lib/assets/icons/botIcon.png"
  );

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();

    KeyboardVisibilityController().onChange.listen((isVisible) {

      scrollToSpecificPosition();
    });
  }

  void scrollToSpecificPosition() {
    scrollController.jumpTo(
      scrollController.position.maxScrollExtent,
    );
  }


  void sendMessage(ChatMessage chatMessage) {
    messages.value = [chatMessage, ...messages];

    try {
      String question = chatMessage.text.toLowerCase();


      List<String> relevantTopics = ["stress", "depression", "anxiety","mental health","mental"];


      bool isRelevant = relevantTopics.any((topic) => question.contains(topic));

      if (isRelevant) {

        gemini.streamGenerateContent(question).listen((event) {
          ChatMessage? lastMsg = messages.firstOrNull;
          if (lastMsg != null && lastMsg.user == geminiUser) {
            lastMsg = messages.removeAt(0);
            String response = event.content?.parts?.fold("", (previous, current) => "$previous${current.text}") ?? "";
            lastMsg.text += response;
            messages.value = [lastMsg, ...messages];
          } else {
            String response = event.content?.parts?.fold("", (previous, current) => "$previous${current.text}") ?? "";
            ChatMessage message = ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response);
            messages.value = [message, ...messages];
          }
        });
      } else {

        ChatMessage message = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: "I can assist you with information related to stress, depression, and anxiety. Please ask me about these topics.",
        );
        messages.value = [message, ...messages];
      }
    } catch (error) {
      print("Error in streaming response: $error");
    }
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
    scrollController.dispose();
    super.dispose();
  }
}
