import 'package:soft_dream_test/shared/exception/base/app_exception.dart';

enum AppFirebaseExceptionType {
  userNotFound('user-not-found'),
  wrongPassword('wrong-password'),
  invalidCredential('invalid-credential'),
  userDisabled('user-disabled'),
  invalidEmail('invalid-email'),
  emailAlreadyInUse('email-already-in-use'),
  tooManyRequests('too-many-requests'),
  permissionDeny('permission-denied'),
  unknown('unknown');
  final String code;
  const AppFirebaseExceptionType(this.code);

  static AppFirebaseExceptionType fromCode(String code) {
    return AppFirebaseExceptionType.values.firstWhere(
      (e) => e.code == code,
      orElse: () => AppFirebaseExceptionType.unknown,
    );
  }
}

class AppFirebaseException extends AppException {
  AppFirebaseException({
    required this.code,
    String? message,
  }) : type = AppFirebaseExceptionType.fromCode(code),
       super(AppExceptionType.firebase, message: message);

  final String code;
  final AppFirebaseExceptionType type;

  @override
  String toString() {
    return 'AppFirebaseException: [${type.name}] $message';
  }
}
