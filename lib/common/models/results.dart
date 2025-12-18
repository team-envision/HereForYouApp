class ResultsModel {
  final DailyScore monday;
  final DailyScore tuesday;
  final DailyScore wednesday;
  final DailyScore thursday;
  final DailyScore friday;
  final DailyScore saturday;
  final DailyScore sunday;
  final String mentalRecommendation;
  final String stressRecommendation;

  ResultsModel({
    required this.mentalRecommendation,
    required this.stressRecommendation,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      mentalRecommendation: json["mental_recommendation"] ?? "",
      stressRecommendation: json["stress_recommendation"] ?? "",
      monday: DailyScore.fromJson(json["monday"] ?? {}),
      tuesday: DailyScore.fromJson(json["tuesday"] ?? {}),
      wednesday: DailyScore.fromJson(json["wednesday"] ?? {}),
      thursday: DailyScore.fromJson(json["thursday"] ?? {}),
      friday: DailyScore.fromJson(json["friday"] ?? {}),
      saturday: DailyScore.fromJson(json["saturday"] ?? {}),
      sunday: DailyScore.fromJson(json["sunday"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mental_recommendation": mentalRecommendation,
      "stress_recommendation": stressRecommendation,
      "monday": monday.toJson(),
      "tuesday": tuesday.toJson(),
      "wednesday": wednesday.toJson(),
      "thursday": thursday.toJson(),
      "friday": friday.toJson(),
      "saturday": saturday.toJson(),
      "sunday": sunday.toJson(),
    };
  }

  ResultsModel copyWith({
    String? mentalRecommendation,
    String? stressRecommendation,
    DailyScore? monday,
    DailyScore? tuesday,
    DailyScore? wednesday,
    DailyScore? thursday,
    DailyScore? friday,
    DailyScore? saturday,
    DailyScore? sunday,
  }) {
    return ResultsModel(
      mentalRecommendation: mentalRecommendation ?? this.mentalRecommendation,
      stressRecommendation: stressRecommendation ?? this.stressRecommendation,
      monday: monday ?? this.monday,
      tuesday: tuesday ?? this.tuesday,
      wednesday: wednesday ?? this.wednesday,
      thursday: thursday ?? this.thursday,
      friday: friday ?? this.friday,
      saturday: saturday ?? this.saturday,
      sunday: sunday ?? this.sunday,
    );
  }

  DailyScore getTodayScore() {
    final int weekday = DateTime.now().weekday;

    switch (weekday) {
      case DateTime.monday:
        return monday;
      case DateTime.tuesday:
        return tuesday;
      case DateTime.wednesday:
        return wednesday;
      case DateTime.thursday:
        return thursday;
      case DateTime.friday:
        return friday;
      case DateTime.saturday:
        return saturday;
      case DateTime.sunday:
        return sunday;
      default:
        return monday;
    }
  }

  ResultsModel updateToday(DailyScore newScore) {
    final int weekday = DateTime.now().weekday;

    switch (weekday) {
      case DateTime.monday:
        return copyWith(monday: newScore);
      case DateTime.tuesday:
        return copyWith(tuesday: newScore);
      case DateTime.wednesday:
        return copyWith(wednesday: newScore);
      case DateTime.thursday:
        return copyWith(thursday: newScore);
      case DateTime.friday:
        return copyWith(friday: newScore);
      case DateTime.saturday:
        return copyWith(saturday: newScore);
      case DateTime.sunday:
        return copyWith(sunday: newScore);
      default:
        return this;
    }
  }

  factory ResultsModel.empty() {
    return ResultsModel(
      mentalRecommendation: "Complete your first test to see results!",
      stressRecommendation: "Take a deep breath and start your journey.",
      monday: DailyScore.empty(),
      tuesday: DailyScore.empty(),
      wednesday: DailyScore.empty(),
      thursday: DailyScore.empty(),
      friday: DailyScore.empty(),
      saturday: DailyScore.empty(),
      sunday: DailyScore.empty(),
    );
  }
}

class DailyScore {
  final int mentalScore;
  final int moodScore;
  final int stressScore;

  DailyScore({
    required this.mentalScore,
    required this.moodScore,
    required this.stressScore,
  });

  factory DailyScore.fromJson(Map<String, dynamic> json) {
    return DailyScore(
      mentalScore: (json['mental_score'] ?? 0) as int,
      moodScore: (json['mood_score'] ?? 0) as int,
      stressScore: (json['stress_score'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mental_score': mentalScore,
      'mood_score': moodScore,
      'stress_score': stressScore,
    };
  }

  DailyScore copyWith({int? mentalScore, int? moodScore, int? stressScore}) {
    return DailyScore(
      mentalScore: mentalScore ?? this.mentalScore,
      moodScore: moodScore ?? this.moodScore,
      stressScore: stressScore ?? this.stressScore,
    );
  }

  factory DailyScore.empty() {
    return DailyScore(mentalScore: 0, moodScore: 0, stressScore: 0);
  }
}
