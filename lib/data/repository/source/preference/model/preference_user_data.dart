class PreferenceUserData {
  final String uid;
  final String fullName;
  final String username;
  final String avatarUrl;

  factory PreferenceUserData.fromJson(Map<String, dynamic> json) {
    return PreferenceUserData(
      uid: json['uid'] as String? ?? '',
      username: json['username'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
    );
  }
  PreferenceUserData({
    this.uid = '',
    this.fullName = '',
    this.username = '',
    this.avatarUrl = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullName': fullName,
      'username': username,
      'avatarUrl': avatarUrl,
    };
  }
}
