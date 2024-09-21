class Questionnaire {
  final List<Question> questions;

  Questionnaire({required this.questions});

  // Factory constructor to create an instance from a JSON object
  factory Questionnaire.fromJson(Map<String, dynamic> json) {
    var questionsList = json['questions'] as List;
    List<Question> questions = questionsList.map((q) => Question.fromJson(q)).toList();
    return Questionnaire(questions: questions);
  }

  // Method to convert the Questionnaire object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

class Question {
  final String question;
  final List<String> options;

  Question({required this.question, required this.options});

  // Factory constructor to create an instance from a JSON object
  factory Question.fromJson(Map<String, dynamic> json) {
    var optionsList = List<String>.from(json['options']);
    return Question(
      question: json['question'],
      options: optionsList,
    );
  }

  // Method to convert the Question object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
    };
  }
}
