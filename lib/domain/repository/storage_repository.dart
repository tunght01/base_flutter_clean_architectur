import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

abstract class StorageRepository {
  bool get isLoggedIn;
  bool get isDarkMode;
  LanguageCode get languageCode;

  bool get isFirstLaunchApp;

  Future<bool> savePassword(String password);

  Future<void> clearCurrentUserData();

  Future<bool> saveCurrentUser({
    required String uid,
    String? fullName,
    String? email,
    String? avtUrl,
  });

  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp);

  Future<bool> saveDarkModeApp(bool isDarkMode);

  Future<bool> saveLanguageApp(String languageApp);
}
