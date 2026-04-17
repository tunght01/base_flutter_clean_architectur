abstract class AuthRepository {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
  });
  Future<void> sendPasswordResetEmail(String email);
  Future<void> logout();
}
