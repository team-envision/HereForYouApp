import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyScore {
  final int mentalScore;
  final int moodScore;
  final int stressScore;
  final String mentalRecommendation;
  final String stressRecommendation;
  final DateTime date;

  DailyScore({
    required this.mentalScore,
    required this.moodScore,
    required this.stressScore,
    required this.mentalRecommendation,
    required this.stressRecommendation,
    required this.date,
  });

  factory DailyScore.fromJson(Map<String, dynamic> json) {
    return DailyScore(
      mentalScore: (json['mental_score'] ?? 0) as int,
      moodScore: (json['mood_score'] ?? 0) as int,
      stressScore: (json['stress_score'] ?? 0) as int,
      mentalRecommendation: json['mental_recommendation'] ?? '',
      stressRecommendation: json['stress_recommendation'] ?? '',
      date: DateUtils.dateOnly(DateTime.parse(json['date'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mental_score': mentalScore,
      'mood_score': moodScore,
      'stress_score': stressScore,
      'mental_recommendation': mentalRecommendation,
      'stress_recommendation': stressRecommendation,
      'date': DateFormat('yyyy-MM-dd').format(date),
    };
  }

  DailyScore copyWith({
    int? mentalScore,
    int? moodScore,
    int? stressScore,
    String? mentalRecommendation,
    String? stressRecommendation,
    DateTime? date,
  }) {
    return DailyScore(
      mentalScore: mentalScore ?? this.mentalScore,
      moodScore: moodScore ?? this.moodScore,
      stressScore: stressScore ?? this.stressScore,
      mentalRecommendation: mentalRecommendation ?? this.mentalRecommendation,
      stressRecommendation: stressRecommendation ?? this.stressRecommendation,
      date: date ?? this.date,
    );
  }

  factory DailyScore.empty() {
    return DailyScore(
      mentalScore: 0,
      moodScore: 0,
      stressScore: 0,
      mentalRecommendation: '',
      stressRecommendation: '',
      date: DateTime.now(),
    );
  }
}
