import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';
import 'package:soft_dream_test/presentation/utils/snackbar_enum.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception_wrapper.dart';

abstract class CommonEvent extends BaseBlocEvent {
  const CommonEvent();
}

class ExceptionEmitted extends CommonEvent {
  final AppExceptionWrapper appExceptionWrapper;
  const ExceptionEmitted({required this.appExceptionWrapper});
}

class LoadingVisibilityEmitted extends CommonEvent {
  final bool isLoading;

  const LoadingVisibilityEmitted({required this.isLoading});
}

class ForceLogoutButtonPressed extends CommonEvent {
  const ForceLogoutButtonPressed();
}

class DevelopingFeatureAbsorbed extends CommonEvent {
  const DevelopingFeatureAbsorbed();
}

class SnackbarExceptionEmitted extends CommonEvent {
  final String message;
  const SnackbarExceptionEmitted({required this.message});
}

class SnackbarSuccessEmitted extends CommonEvent {
  final String message;
  const SnackbarSuccessEmitted({required this.message});
}

class SnackbarWarningEmitted extends CommonEvent {
  final String message;
  const SnackbarWarningEmitted({required this.message});
}

class SnackbarEmitted extends CommonEvent {
  final SnackbarType snackbarType;
  final String message;
  const SnackbarEmitted({required this.snackbarType, required this.message});
}

class SnackbarShowOff extends CommonEvent {
  const SnackbarShowOff();
}
