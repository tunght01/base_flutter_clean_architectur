import 'package:soft_dream_test/domain/entities/account_info.dart';

abstract class StoreRepository {
  Future<AccountInfo> saveUserProfile(AccountInfo account);
  Future<AccountInfo> getUserProfile(String uid);
}
