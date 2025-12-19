import 'package:firebase_ai/firebase_ai.dart';

class GeminiSettings {
  GeminiSettings._();

  static final Schema userAssessmentSchema = Schema.object(
    properties: {
      "mental_score": Schema.integer(
        description: "A total mental wellness score from 0 to 100",
      ),
      "mood_quality": Schema.integer(
        description: "A rating of the user's mood from 0 to 100",
      ),
      "stress_level": Schema.integer(
        description: "A rating of current stress from 0 to 100",
      ),
      "mental_recommendation": Schema.string(
        description: "A short, actionable tip based on their mental score.",
      ),
      "stress_recommendation": Schema.string(
        description: "A short, actionable tip to manage their stress level.",
      ),
    },
  );

  static final GenerationConfig userAssessmentConfig = GenerationConfig(
    responseMimeType: "application/json",
    responseSchema: userAssessmentSchema,
  );

  static final Content userAssessmentPrompt = Content.system(
    "You are the engine for HereForYou. Analyze user input for a mind test. "
    "Be precise with scores and compassionate with recommendations.",
  );

  static const String model = "gemini-2.5-flash";
}
