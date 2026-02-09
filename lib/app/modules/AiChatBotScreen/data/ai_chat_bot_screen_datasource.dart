import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_ai.dart';
import 'package:here_for_you_app/common/models/message.dart';
import 'package:logger/logger.dart';

class AiChatBotScreenDataSource {
  final FirebaseAi firebaseAI;
  late ChatSession chatSession;
  Logger logger = Logger();

  AiChatBotScreenDataSource({required this.firebaseAI}) {
    chatSession = firebaseAI.startChatSession();
  }

  Future<Either<CustomException, MessageModel>> sendMessage(
    String userMessage,
  ) async {
    try {
      Content message = Content.text(userMessage);
      final response = await chatSession.sendMessage(message);
      logger.d("AI response: ${response.text}");
      final Map<String, dynamic> jsonMap = jsonDecode(response.text!);
      return Right(MessageModel.fromJson(jsonMap));
    } catch (e) {
      logger.e("Error parsing AI response: $e");
      return Left(CustomException(message: e.toString()));
    }
  }
}
