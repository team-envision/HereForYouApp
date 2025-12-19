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

  EmergencyContactModel.empty()
    : name = '',
      number = '',
      email = '',
      relation = '';

  factory EmergencyContactModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return EmergencyContactModel(
      name: data['name'] ?? '',
      number: data['number'] ?? '',
      email: data['email'] ?? '',
      relation: data['relation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'email': email,
      'relation': relation,
    };
  }

  EmergencyContactModel copyWith({
    String? name,
    String? number,
    String? email,
    String? relation,
  }) {
    return EmergencyContactModel(
      name: name ?? this.name,
      number: number ?? this.number,
      email: email ?? this.email,
      relation: relation ?? this.relation,
    );
  }
}
