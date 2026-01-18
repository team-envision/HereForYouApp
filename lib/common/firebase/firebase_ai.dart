import 'package:firebase_ai/firebase_ai.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../utils/gemini_settings.dart';

class FirebaseAi extends GetxService {
  Logger logger = Logger();

  Future<GenerateContentResponse> analyzeUserState({
    required Map<String, String> userAnswers,
  }) {
    try {
      final model = FirebaseAI.googleAI().generativeModel(
        model: GeminiSettings.model,
        generationConfig: GeminiSettings.userAssessmentConfig,
        systemInstruction: GeminiSettings.userAssessmentPrompt,
      );
      final String prompt =
          "Analyze these user responses: ${userAnswers.toString()}";
      final content = [Content.text(prompt)];
      final response = model.generateContent(content);
      return response;
    } catch (e) {
      logger.e("FirebaseAI error: $e");
      rethrow;
    }
  }

  ChatSession startChatSession() {
    final model = FirebaseAI.googleAI().generativeModel(
      model: GeminiSettings.model,
      generationConfig: GeminiSettings.chatResponseConfig,
      systemInstruction: GeminiSettings.chatPrompt,
    );

    return model.startChat();
  }
}
