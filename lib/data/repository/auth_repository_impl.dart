import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/repository/source/firebase/auth_datasource.dart';
import 'package:soft_dream_test/domain/entities/account_info.dart';
import 'package:soft_dream_test/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final credential = await _authDatasource.signInWithEmailAndPassword(email, password);
    final user = credential.user!;
    print(user);
  }

  @override
  Future<AccountInfo> signUp({required String email, required String password, required String fullName}) async {
    final credential = await _authDatasource.signUpWithEmailAndPassword(email, password);

    final user = credential.user!;

    // gửi verify email (khuyến nghị)
    await user.sendEmailVerification();
    final now = Timestamp.now();

    final response = AccountInfo(uid: user.uid, email: email, emailVerified: user.emailVerified, fullName: fullName, createdAt: now, updatedAt: now);
    return response;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _authDatasource.sendPasswordResetEmail(email);
  }
}
