import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/shared/exception/firebase/app_firebase_exception.dart';

extension FirebaseExeptionExt on AppFirebaseExceptionType {
  String get message {
    switch (this) {
      case AppFirebaseExceptionType.userNotFound:
        return S.current.login_error_user_not_found;
      case AppFirebaseExceptionType.wrongPassword:
        return S.current.login_error_wrong_password;
      case AppFirebaseExceptionType.invalidCredential:
        return S.current.login_error_invalid_credential;
      case AppFirebaseExceptionType.userDisabled:
        return S.current.login_error_user_disabled;
      case AppFirebaseExceptionType.invalidEmail:
        return S.current.login_error_invalid_email;
      case AppFirebaseExceptionType.emailAlreadyInUse:
        return S.current.exist_email;
      case AppFirebaseExceptionType.tooManyRequests:
        return S.current.login_error_too_many_requests;
      case AppFirebaseExceptionType.networkRequestFailed:
        return S.current.error_no_internet;
      case AppFirebaseExceptionType.unknown:
        return S.current.login_error_unknown;
      case AppFirebaseExceptionType.permissionDeny:
        return S.current.login_error_unknown;
    }
  }
}
