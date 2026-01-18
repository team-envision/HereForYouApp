import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:here_for_you_app/app/modules/AiChatBotScreen/presentation/widgets/markdown_messages.dart';

class PlainMessage extends StatelessWidget {
  final ChatMessage message;
  final bool isCurrentUser;

  const PlainMessage({
    super.key,
    required this.message,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return MarkdownMessage(text: message.text, isCurrentUser: isCurrentUser);
  }
}
