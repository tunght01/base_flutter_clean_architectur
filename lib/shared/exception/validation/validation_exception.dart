import '../base/app_exception.dart';

class ValidationException extends AppException {
  const ValidationException(this.kind) : super(AppExceptionType.validation);

  final ValidationExceptionKind kind;

  @override
  String toString() {
    return 'ValidationException: {kind: $kind}';
  }
}

class DataValidationException extends ValidationException {
  const DataValidationException(this.type)
      : super(ValidationExceptionKind.dataValidation);
  final DataValidationExceptionKind type;

  @override
  String toString() {
    return 'DataValidationException: {type: $type}';
  }
}

enum ValidationExceptionKind {
  logOut,
  notLogin,
  invalidPin,
  invalidOTP,
  invalidEmail,
  emptyEmail,
  invalidPassword,
  invalidUserName,
  invalidPhoneNumber,
  invalidDateTime,
  passwordsAreNotMatch,
  invalidPrice,
  invalidVolume,
  biomestricIsNotRegistered,
  duplicateWatchlistName,
  frontRearNotMatch,
  vailidateImage,
  insufficentPurchasingPower,
  dataValidation,
}

enum DataValidationExceptionKind {
  invalidPin,
  invalidOTP,
  invalidEmail,
  invalidPassword,
  invalidUserName,
  invalidPhoneNumber,
  invalidDateTime,
  passwordsAreNotMatch,
  invalidPrice,
  invalidVolume,
  biomestricIsNotRegistered,
  duplicateWatchlistName,
  insufficentPurchasingPower,
  canNotGetPriceInfo,
}