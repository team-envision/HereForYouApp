import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyContactModel {
  final String name;
  final String number;
  final String email;
  final String relation;

  EmergencyContactModel({
    required this.name,
    required this.number,
    required this.email,
    required this.relation,
  });

  factory EmergencyContactModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return EmergencyContactModel(
      name: data['name'] ?? '',
      number: data['number'] ?? '',
      email: data['email'] ?? '',
      relation: data['relation'] ?? '',
    );
  }
}
