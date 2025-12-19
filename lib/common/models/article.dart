import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  final String image;
  final String label;
  final String link;

  ArticleModel({required this.image, required this.label, required this.link});

  factory ArticleModel.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ArticleModel(
      image: data['image'],
      label: data['label'],
      link: data['link'],
    );
  }
}
