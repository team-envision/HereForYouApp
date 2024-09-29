class QuestionnaireModel {
  final DASS21 dass21;
  final GAD7 gad7;
  final PHQ9 phq9;
  final BACE bace;
  final SDRS sdrs;

  QuestionnaireModel({
    required this.dass21,
    required this.gad7,
    required this.phq9,
    required this.bace,
    required this.sdrs,
  });

  factory QuestionnaireModel.fromJson(Map<String, dynamic> json) {
    return QuestionnaireModel(
      dass21: DASS21.fromJson(json['DASS_21']),
      gad7: GAD7.fromJson(json['GAD_7']),
      phq9: PHQ9.fromJson(json['PHQ_9']),
      bace: BACE.fromJson(json['BACE']),
      sdrs: SDRS.fromJson(json['SDRS']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DASS_21': dass21.toJson(),
      'GAD_7': gad7.toJson(),
      'PHQ_9': phq9.toJson(),
      'BACE': bace.toJson(),
      'SDRS': sdrs.toJson(),
    };
  }
}

class DASS21 {
  final List<String> questions;
  final List<String> options;

  DASS21({
    required this.questions,
    required this.options,
  });

  factory DASS21.fromJson(Map<String, dynamic> json) {
    return DASS21(
      questions: List<String>.from(json['questions']),
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions': questions,
      'options': options,
    };
  }
}

class GAD7 {
  final List<String> questions;
  final List<String> options;


  GAD7({
    required this.questions,
    required this.options,
  });

  factory GAD7.fromJson(Map<String, dynamic> json) {
    return GAD7(
      questions: List<String>.from(json['questions']),
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions': questions,
      'options': options,
    };
  }
}

class PHQ9 {
  final List<String> questions;
  final List<String> options;

  PHQ9({
    required this.questions,
    required this.options,
  });

  factory PHQ9.fromJson(Map<String, dynamic> json) {
    return PHQ9(
      questions: List<String>.from(json['questions']),
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions': questions,
      'options': options,
    };
  }
}

class BACE {
  final List<String> questions;
  final List<String> options;

  BACE({
    required this.questions,
    required this.options,
  });

  factory BACE.fromJson(Map<String, dynamic> json) {
    return BACE(
      questions: List<String>.from(json['questions']),
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions': questions,
      'options': options,
    };
  }
}

class SDRS {
  final List<String> questions;
  final List<String> options;

  SDRS({
    required this.questions,
    required this.options,
  });

  factory SDRS.fromJson(Map<String, dynamic> json) {
    return SDRS(
      questions: List<String>.from(json['questions']),
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions': questions,
      'options': options,
    };
  }
}
