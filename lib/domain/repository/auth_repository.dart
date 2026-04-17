import 'package:soft_dream_test/domain/entities/account_info.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<AccountInfo> signUp({required String email, required String password, required String fullName});
  Future<void> sendPasswordResetEmail(String email);
}
