import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SignUpRequest {
  final String email;
  final String fullName;
  final String avatarUrl;
  final String provider;

  SignUpRequest({
    required this.email,
    required this.fullName,
    this.avatarUrl = '',
    this.provider = 'password',
  });
}
