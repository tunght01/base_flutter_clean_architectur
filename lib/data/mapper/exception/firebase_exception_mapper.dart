import 'package:firebase_auth/firebase_auth.dart';
import 'package:soft_dream_test/shared/exception/base/exception_mapper.dart';
import 'package:soft_dream_test/shared/exception/firebase/app_firebase_exception.dart';

class FirebaseExceptionMapper extends ExceptionMapper<AppFirebaseException> {
  @override
  AppFirebaseException map(Object? exception) {
    if (exception is AppFirebaseException) {
      return exception;
    }
    if (exception is FirebaseAuthException) {
      return AppFirebaseException(
        code: exception.code,
        message: exception.message,
      );
    }

    if (exception is FirebaseException) {
      return AppFirebaseException(
        code: exception.code,
        message: exception.message,
      );
    }

    return AppFirebaseException(
      code: AppFirebaseExceptionType.unknown.code,
      message: exception?.toString(),
    );
  }
}
