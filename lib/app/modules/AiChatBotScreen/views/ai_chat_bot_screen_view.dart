import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import '../controllers/ai_chat_bot_screen_controller.dart';

class AiChatBotScreenView extends GetView<AiChatBotScreenController> {
  const AiChatBotScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AiChatBotScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: controller.scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: Get.height * 0.6,
              title: const Text("A.I Chat Bot"),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              floating: true,
              snap: true,
              pinned: true,
              centerTitle: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              titleTextStyle: Get.theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipPath(
                      clipper: ArcClipper(),
                      child: Container(
                        width: double.infinity,
                        height: Get.height * 0.4,
                        color: const Color.fromRGBO(229, 229, 228, 1),
                        child: Image.asset(
                          "lib/assets/images/AiChatBotImage.png",
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Your Mental Health Companion",
                      style: Get.theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        controller.Textdata,
                        style: Get.theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Obx(() => DashChat(
          currentUser: controller.user,
          messageOptions: MessageOptions(
            messageTextBuilder: (msg, prevMsg, nextMsg) {
              if (msg != null && msg.user.id == controller.geminiUser.id) {
                return MarkdownBody(
                  data: msg.text,
                  styleSheet: MarkdownStyleSheet(
                    p: const TextStyle(fontSize: 16),
                    strong: const TextStyle(fontWeight: FontWeight.bold),
                    blockquote: const TextStyle(fontStyle: FontStyle.italic),
                    listBullet: const TextStyle(fontSize: 16),
                  ),
                );
              }
              return Text(msg.text);
            },
            showOtherUsersAvatar: true,
            avatarBuilder: (p0, onPressAvatar, onLongPressAvatar) =>
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset("lib/assets/icons/botIcon.png"),
                ),
          ),
          inputOptions: InputOptions(
            sendOnEnter: true,
            alwaysShowSend: false,
            inputToolbarMargin:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            inputToolbarPadding: const EdgeInsets.only(right: 20),
            inputToolbarStyle: BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white),
              boxShadow: const [BoxShadow(color: Colors.black38)],
            ),
            inputDecoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Ask Your Question",
              hintStyle: const TextStyle(color: Colors.black38),
              prefixIconColor: Colors.black38,
              prefixIcon: const Icon(Icons.file_upload_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          onSend: controller.sendMessage,
          messages: controller.messages.value,
          messageListOptions: MessageListOptions(
              typingBuilder: (val) => const Text("MentAid is typing..."),
              loadEarlierBuilder: const Text("MentAid is typing...")),
        )),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(size.width / 2, size.height * 0.7, size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
