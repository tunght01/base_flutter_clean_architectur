class AccountInfo {
  final String uid;
  final String email;
  final String fullName;
  final String avatarUrl;
  final String provider;
  final bool emailVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastLoginAt;
  final DateTime? termsAcceptedAt;

  AccountInfo({
    required this.uid,
    required this.email,
    required this.fullName,
    this.avatarUrl = '',
    this.provider = 'password',
    required this.emailVerified,
    this.createdAt,
    this.updatedAt,
    this.lastLoginAt,
    this.termsAcceptedAt,
  });
}
