import 'package:soft_dream_test/domain/entities/account_info.dart';
import 'package:soft_dream_test/domain/entities/request/create_user_request.dart';

abstract class StoreRepository {
  Future<void> saveUserProfile(CreateUserRequest account);
  Future<AccountInfo?> getUserProfile();
}
