import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception.dart';
import 'package:soft_dream_test/shared/exception/remote/remote_exception.dart';

import 'package:soft_dream_test/shared/exception/firebase/app_firebase_exception.dart';
import 'package:soft_dream_test/shared/utils/extension/exception_ext.dart';

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(AppException appException) {
    return switch (appException.appExceptionType) {
      AppExceptionType.remote =>
        switch ((appException as RemoteException).kind) {
          RemoteExceptionKind.badCertificate => 'ERROR badCertificate',
          RemoteExceptionKind.noInternet => 'ERROR noInternet',
          RemoteExceptionKind.network => 'ERROR network',
          RemoteExceptionKind.serverDefined =>
            appException.generalServerMessage ?? 'ERROR serverDefined',
          RemoteExceptionKind.serverUndefined =>
            appException.generalServerMessage ?? 'ERROR serverUndefined',
          RemoteExceptionKind.timeout => 'ERROR timeout',
          RemoteExceptionKind.cancellation => 'ERROR cancellation',
          RemoteExceptionKind.unknown => 'ERROR unknown',
          RemoteExceptionKind.refreshTokenFailed => 'ERROR refreshTokenFailed',
          RemoteExceptionKind.decodeError => 'ERROR decodeError',
        },
      AppExceptionType.parse => 'ERROR parse',
      AppExceptionType.uncaught => 'ERROR uncaught',
      AppExceptionType.validation => 'ERROR validation',
      AppExceptionType.remoteConfig => 'ERROR remoteConfig',
      AppExceptionType.firebase => _mapFirebaseException(appException),
    };
  }

  String _mapFirebaseException(AppException exception) {
    if (exception is AppFirebaseException) {
      return exception.type.message;
    }
    return S.current.login_error_unknown;
  }
}
