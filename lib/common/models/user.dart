import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String status;
  final String gender;
  final String age;
  final String weight;
  final String height;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
  });

  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      status: data['status'] ?? '',
      gender: data['gender'] ?? '',
      age: data['age'] ?? '',
      weight: data['weight'] ?? '',
      height: data['height'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'status': status,
      'gender': gender,
      'age': age,
      'weight': weight,
      'height': height,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? status,
    String? gender,
    String? age,
    String? weight,
    String? height,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  UserModel.empty()
    : name = '',
      email = '',
      phone = '',
      status = '',
      gender = '',
      age = '',
      weight = '',
      height = '';
}
