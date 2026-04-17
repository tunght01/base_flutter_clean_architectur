import 'package:cloud_firestore/cloud_firestore.dart';

class AccountInfo {
  final String uid;
  final String email;
  final String fullName;
  final String avatarUrl;
  final String provider;
  final bool emailVerified;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final Timestamp lastLoginAt;

  AccountInfo({required this.uid, required this.email, required this.fullName, this.avatarUrl = '', this.provider = 'password', required this.emailVerified, required this.createdAt, required this.updatedAt, this.lastLoginAt});
}
