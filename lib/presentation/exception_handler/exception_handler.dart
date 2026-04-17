import 'package:firebase_auth/firebase_auth.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_event.dart';
import 'package:soft_dream_test/shared/constants/duration_constants.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception_wrapper.dart';
import 'package:soft_dream_test/shared/exception/firebase/app_firebase_exception.dart';
import 'package:soft_dream_test/shared/exception/remote/remote_exception.dart';

import '../../di/di.dart';

class ExceptionHandler {
  const ExceptionHandler({required this.navigator, required this.listener});

  final AppNavigator navigator;
  final ExceptionHandlerListener listener;

  Future<void> handleException(
    AppExceptionWrapper appExceptionWrapper,
    String commonExceptionMessage,
  ) async {
    final message =
        appExceptionWrapper.overrideMessage ?? commonExceptionMessage;

    switch (appExceptionWrapper.appException.appExceptionType) {
      case AppExceptionType.remote:
        final exception = appExceptionWrapper.appException as RemoteException;
        switch (exception.kind) {
          case RemoteExceptionKind.refreshTokenFailed:
            break;
          case RemoteExceptionKind.noInternet:
          case RemoteExceptionKind.timeout:
            break;
          case RemoteExceptionKind.serverDefined:
            await _showErrorSnackBar(message: message);
            break;
          default:
            break;
        }
        break;
      case AppExceptionType.parse:
        return _showErrorSnackBar(message: message);
      case AppExceptionType.remoteConfig:
        return _showErrorSnackBar(message: message);
      case AppExceptionType.uncaught:
        return _showErrorSnackBar(message: message);

      case AppExceptionType.validation:
        return _showErrorSnackBar(message: message);
      case AppExceptionType.firebase:
        if (appExceptionWrapper.appException is FirebaseAuthException &&
            (appExceptionWrapper.appException as AppFirebaseException).type ==
                AppFirebaseExceptionType.permissionDeny) {
          logout();
          return;
        }
        return _showErrorSnackBar(message: message);
    }
  }

  Future<void> logout() async {
    getIt.get<AppBloc>().add(const IsLoggedInStatusChanged(isLoggedIn: false));
    navigator.handleRequiredLogin();
  }

  Future<void> _showErrorSnackBar({
    required String message,
    Duration duration = DurationConstants.defaultErrorVisibleDuration,
  }) async {
    navigator.showErrorSnackBar(message, duration: duration);
  }
}

abstract class ExceptionHandlerListener {
  void onRefreshTokenFailed();
}
