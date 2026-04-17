class PreferenceUserData {
  final String uid;
  final String? fullName;
  final String? username;
  final String? avatarUrl;

  factory PreferenceUserData.fromJson(Map<String, dynamic> json) {
    return PreferenceUserData(uid: json['uid'] as String? ?? '', username: json['username'] as String? ?? '', fullName: json['fullName'] as String? ?? '', avatarUrl: json['avatarUrl'] as String? ?? '');
  }
  PreferenceUserData({this.uid = '', this.fullName = '', this.username = '', this.avatarUrl = ''});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid;
    if (fullName != null) {
      data['fullName'] = fullName;
    }
    if (username != null) {
      data['username'] = username;
    }
    if (avatarUrl != null) {
      data['avatarUrl'] = avatarUrl;
    }
    return data;
  }
}
