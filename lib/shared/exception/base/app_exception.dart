abstract class AppException implements Exception {
  const AppException(this.appExceptionType, {this.message, this.stackTrace});

  final AppExceptionType appExceptionType;
  final String? message;
  final StackTrace? stackTrace;
}

enum AppExceptionType {
  remote,
  firebase,
  parse,
  remoteConfig,
  uncaught,
  validation,
}
