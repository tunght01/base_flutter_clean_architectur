import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

abstract class StorageRepository {
  bool get isLoggedIn;
  bool get isDarkMode;
  LanguageCode get languageCode;

  Future<bool> savePassword(String password);

  Future<void> clearCurrentUserData();

  Future<bool> saveCurrentUser({
     String uid,
     String fullName,
     String email,
     String avtUrl,
  });
}
