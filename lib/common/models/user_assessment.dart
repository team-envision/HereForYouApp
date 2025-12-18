class UserAssessmentModel {
  final int mentalScore;
  final int moodQuality;
  final int stressLevel;
  final String mentalTip;
  final String stressTip;

  UserAssessmentModel.fromJson(Map<String, dynamic> json)
    : mentalScore = json['mental_score'],
      moodQuality = json['mood_quality'],
      stressLevel = json['stress_level'],
      mentalTip = json['mental_recommendation'],
      stressTip = json['stress_recommendation'];
}
