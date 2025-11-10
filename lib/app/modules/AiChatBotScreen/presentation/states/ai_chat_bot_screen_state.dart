import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:get/get.dart';

class AiChatBotScreenState extends GetXState {
  GenerativeModel model = FirebaseAI.googleAI().generativeModel(
    model: "gemini-2.5-flash",
  );

  String Textdata =
      "Our AI Chatbot is here to help you navigate "
      "through mental health challenges with instant "
      "support, guidance, and resources. Whether "
      "you’re feeling stressed, anxious, or just need "
      "someone to talk to, our AI is ready to listen and "
      "provide helpful insights.";
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  RxBool isGeminiTyping = false.obs;
  ChatUser user = ChatUser(id: '0', firstName: 'Rythym', lastName: "Gupta");

  final ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'MentAid',
    profileImage: "assets/icons/botIcon.png",
  );
  var scrollController;
}
