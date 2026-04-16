import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/repository/source/firebase/firebase_auth_datasource.dart';
import 'package:soft_dream_test/domain/repository/app_repository.dart';
import 'package:soft_dream_test/shared/exception/firebase/app_firebase_exception.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final FirebaseAuthDatasource _authDatasource;

  AppRepositoryImpl(this._authDatasource);

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final credential = await _authDatasource.signInWithEmailAndPassword(
      email,
      password,
    );
    final user = credential.user!;
    print(user);
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    final credential = await _authDatasource.signUpWithEmailAndPassword(
      email,
      password,
    );
    final user = credential.user!;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _authDatasource.sendPasswordResetEmail(email);
  }
}
