import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'base/firebase_client.dart';

@LazySingleton()
class AuthDatasource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseClient _client;

  AuthDatasource(this._firebaseAuth, this._client);

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _client.request(
      action: () => _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _client.request(
      action: () => _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _client.request(
      action: () => _firebaseAuth.sendPasswordResetEmail(email: email),
    );
  }

  Future<void> signOut() {
    return _client.request(
      action: () => _firebaseAuth.signOut(),
    );
  }
}
