class AccountInfoModel {
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

  AccountInfoModel({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.avatarUrl,
    required this.provider,
    required this.emailVerified,
    this.createdAt,
    this.updatedAt,
    this.lastLoginAt,
    this.termsAcceptedAt,
  });

  factory AccountInfoModel.fromJson(Map<String, dynamic> json) {
    return AccountInfoModel(
      uid: json['uid'] as String? ?? json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      provider: json['provider'] as String? ?? 'password',
      emailVerified: json['emailVerified'] as bool? ?? false,
      createdAt: json['createdAt'] != null
          ? (json['createdAt']?.toDate() as DateTime?) // Firestore timestamp
              ?? DateTime.tryParse(json['createdAt'].toString()) // ISO string
          : null,
      updatedAt: json['updatedAt'] != null
          ? (json['updatedAt']?.toDate() as DateTime?) 
              ?? DateTime.tryParse(json['updatedAt'].toString())
          : null,
      lastLoginAt: json['lastLoginAt'] != null
          ? (json['lastLoginAt']?.toDate() as DateTime?) 
              ?? DateTime.tryParse(json['lastLoginAt'].toString())
          : null,
      termsAcceptedAt: json['termsAcceptedAt'] != null
          ? (json['termsAcceptedAt']?.toDate() as DateTime?) 
              ?? DateTime.tryParse(json['termsAcceptedAt'].toString())
          : null,
    );
  }
}
