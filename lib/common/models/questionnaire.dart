import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionnaireModel {
  final String description;
  final String nextId;
  final String note;
  final List<String> options;
  final String progressLabel;
  final List<String> questions;

  QuestionnaireModel({
    required this.description,
    required this.nextId,
    required this.note,
    required this.options,
    required this.progressLabel,
    required this.questions,
  });

  factory QuestionnaireModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return QuestionnaireModel(
      description: data['description'] ?? "",
      nextId: data['next_test_id'] ?? "",
      note: data['note'] ?? "",
      progressLabel: data['progress_label'] ?? "",
      questions: List<String>.from(data['questions'] ?? []),
      options: List<String>.from(data['options'] ?? []),
    );
  }
}
