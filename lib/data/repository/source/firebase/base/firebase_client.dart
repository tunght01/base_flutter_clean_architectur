import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/mapper/exception/firebase_exception_mapper.dart';
import 'package:soft_dream_test/shared/exception/remote/remote_exception.dart';

@LazySingleton()
class FirebaseClient {
  final FirebaseExceptionMapper _exceptionMapper = FirebaseExceptionMapper();

  /// tao ra ham request de xet timeout // xu li mapper exception de user case va bloc mapping duowc message
  Future<T> request<T>({
    required Future<T> Function() action,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    try {
      return await action().timeout(timeout);
    } on TimeoutException {
      throw const RemoteException(kind: RemoteExceptionKind.timeout);
    } catch (e) {
      throw _exceptionMapper.map(e);
    }
  }
}
