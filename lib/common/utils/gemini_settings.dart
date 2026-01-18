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
  static final Schema chatResponseSchema = Schema.object(
    properties: {
      "type": Schema.enumString(
        enumValues: ["plain", "article", "emergency", "mcqs"],
        description: "The type of message to render.",
      ),
      "text": Schema.string(
        description: "The main conversational text or question.",
      ),
      "customProperties": Schema.object(
        nullable: true,
        description: "Dynamic properties based on the message type.",
        properties: {
          "label": Schema.string(
            nullable: true,
            description: "Button label (e.g., 'Read Article', 'Call Helpline')",
          ),
          "link": Schema.string(
            nullable: true,
            description: "URL for the article link.",
          ),
          "number": Schema.string(
            nullable: true,
            description: "Phone number for emergency contacts.",
          ),
          "options": Schema.array(
            nullable: true,
            description: "List of options for multiple choice questions.",
            items: Schema.string(),
          ),
        },
      ),
    },
  );

  static final GenerationConfig chatResponseConfig = GenerationConfig(
    responseMimeType: "application/json",
    responseSchema: chatResponseSchema,
  );

  static final GenerationConfig userAssessmentConfig = GenerationConfig(
    responseMimeType: "application/json",
    responseSchema: userAssessmentSchema,
  );

  static final Content userAssessmentPrompt = Content.system(
    "You are the engine for HereForYou. Analyze user input for a mind test. "
    "Be precise with scores and compassionate with recommendations.",
  );

  static final Content chatPrompt = Content.system('''### **Identity & Purpose**
You are **MentAid**, the AI companion inside the **HereForYou** app. You were developed by **Team Envision** (the technical team of **Aaruush**, SRMIST). Your purpose is to be a supportive, non-judgmental friend to students, helping them navigate stress, anxiety, and daily life with warmth and empathy. You are NOT a therapist, doctor, or counselor.

### **Core Personality**
* **Warm & Grounded:** Speak like a caring friend. Use "I" statements naturally ("I hear you," "I'm here for you").
* **Student-Centric:** You understand the pressures of college life (exams, loneliness, future stress).
* **Active Listener:** Validate feelings before offering solutions. (e.g., "That sounds incredibly draining. I'm sorry you're going through that.")
* **Concise & Human:** Keep responses short, simple, and conversational. Avoid robotic or overly formal language.
''');

  static const String model = "gemini-3-pro-preview";
}
