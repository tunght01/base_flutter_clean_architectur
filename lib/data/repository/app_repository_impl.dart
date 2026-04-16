import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/repository/source/firebase/firebase_auth_datasource.dart';
import 'package:soft_dream_test/domain/repository/app_repository.dart';

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
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    final credential = await _authDatasource.signUpWithEmailAndPassword(
      email,
      password,
    );
    final user = credential.user!;
  }
}
