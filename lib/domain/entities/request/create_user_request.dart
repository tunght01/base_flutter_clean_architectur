import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUserRequest {
  final String uid;
  final String email;
  final String fullName;
  final String avatarUrl;
  final String provider;
  final bool emailVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? termsAcceptedAt;

  CreateUserRequest({
    required this.uid,
    required this.email,
    required this.fullName,
    this.avatarUrl = '',
    this.provider = 'password',
    required this.emailVerified,
    this.createdAt,
    this.updatedAt,
    this.termsAcceptedAt,
  });

  CreateUserRequest copyWith({
    String? uid,
    String? email,
    String? fullName,
    String? avatarUrl,
    String? provider,
    bool? emailVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? termsAcceptedAt,
  }) {
    return CreateUserRequest(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      provider: provider ?? this.provider,
      emailVerified: emailVerified ?? this.emailVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      termsAcceptedAt: termsAcceptedAt ?? this.termsAcceptedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'avatarUrl': avatarUrl,
      'provider': provider,
      'emailVerified': emailVerified,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'termsAcceptedAt': FieldValue.serverTimestamp(),
    };
  }
}
