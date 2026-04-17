import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft_dream_test/config/theme_config.dart';
import 'package:soft_dream_test/data/repository/source/preference/model/preference_user_data.dart';
import 'package:soft_dream_test/shared/constants/shared_preference_constants.dart';
import 'package:soft_dream_test/shared/utils/extension/theme_utils.dart';

@LazySingleton()
class AppPreferences {
  AppPreferences(this._sharedPreference);

  final SharedPreferences _sharedPreference;

  bool get isDarkMode {
    return _sharedPreference.getBool(SharedPreferenceKeys.isDarkMode) ??
        ThemeConfig.defaultThemeMode.isDarkMode;
  }

  String get languageCode =>
      _sharedPreference.getString(SharedPreferenceKeys.languageCode) ?? '';

  bool get isLoggedIn {
    final token = currentUser?.uid ?? '';

    return token.isNotEmpty;
  }

  PreferenceUserData? get currentUser {
    final user = _sharedPreference.getString(SharedPreferenceKeys.user);
    if (user == null) {
      return null;
    }

    return PreferenceUserData.fromJson(json.decode(user));
  }

  Future<bool> saveCurrentUser(PreferenceUserData preferenceUserData) {
    if (currentUser?.uid == preferenceUserData.uid) {
      clearCurrentUserData();
    }
    return _sharedPreference.setString(
      SharedPreferenceKeys.user,
      json.encode(preferenceUserData),
    );
  }

  Future<bool> saveLanguageCode(String languageCode) {
    return _sharedPreference.setString(
      SharedPreferenceKeys.languageCode,
      languageCode,
    );
  }

  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreference.setBool(
      SharedPreferenceKeys.isDarkMode,
      isDarkMode,
    );
  }

  Future<void> clearCurrentUserData() async {
    await Future.wait([_sharedPreference.remove(SharedPreferenceKeys.user)]);
  }
}
