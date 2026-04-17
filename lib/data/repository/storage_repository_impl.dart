import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/repository/source/preference/app_preferences.dart';
import 'package:soft_dream_test/data/repository/source/preference/model/preference_user_data.dart';
import 'package:soft_dream_test/data/repository/source/secure_storage/secure_store_local_data_source.dart';
import 'package:soft_dream_test/domain/mapper/storage/language_code_data_mapper.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/shared/constants/secure_storage_constants.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

@LazySingleton(as: StorageRepository)
class StorageRepositoryImpl implements StorageRepository {
  final SecureStoreLocalDataSource _secureStoreLocalDataSource;
  final AppPreferences _appPreferences;

  /// mapper
  final LanguageCodeDataMapper _languageCodeDataMapper;
  StorageRepositoryImpl(this._secureStoreLocalDataSource, this._appPreferences, this._languageCodeDataMapper);

  @override
  Future<bool> savePassword(String password) async {
    await _secureStoreLocalDataSource.write(key: SecureStorageKeys.password, value: password);
    return true;
  }

  @override
  Future<bool> saveCurrentUser({required String uid, String? fullName, String? email, String? avtUrl}) {
    return _appPreferences.saveCurrentUser(PreferenceUserData(uid: uid, fullName: fullName, username: email, avatarUrl: avtUrl));
  }

  @override
  bool get isLoggedIn => _appPreferences.isLoggedIn;

  @override
  bool get isDarkMode => _appPreferences.isDarkMode;

  @override
  LanguageCode get languageCode => _languageCodeDataMapper.mapToEntity(_appPreferences.languageCode);

  @override
  Future<void> clearCurrentUserData() async {
    await _appPreferences.clearCurrentUserData();
  }
}
