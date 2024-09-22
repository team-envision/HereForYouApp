import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
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


  RxList<ChatMessage> messages=<ChatMessage>[].obs;
  ChatUser user = ChatUser(
    id: '1',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );


  var scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    ChatUser user = ChatUser(
      id: '1',
      firstName: 'Charles',
      lastName: 'Leclerc',
    );

     messages.value = <ChatMessage> [
      ChatMessage(
        text: 'Hey!',
        user: user,
        createdAt: DateTime.now(),
      ),
    ];

     KeyboardVisibilityController().onChange.listen((isVisible){
       print("listened");
       print(isVisible);
         scrollToSpecificPosition();
     });
  }

  void scrollToSpecificPosition() {
    print("called");
    scrollController.jumpTo(
      scrollController.position.maxScrollExtent,

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
    scrollController.dispose();
    super.dispose();
  }
}
