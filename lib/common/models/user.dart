import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String createdAt;
  final String status;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.status,
  });

  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      createdAt: data['createdAt'] ?? '',
      status: data['status'] ?? '',
    );
  }
}
