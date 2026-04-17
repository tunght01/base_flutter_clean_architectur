import 'package:firebase_auth/firebase_auth.dart';
import 'package:soft_dream_test/config/log_config.dart';
import 'package:soft_dream_test/domain/usecase/base/base_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception.dart';
import 'package:soft_dream_test/shared/exception/uncaught/app_uncaught_exception.dart';

import '../../../../shared/exception/firebase/app_firebase_exception.dart';

abstract class BaseFutureUseCase<
  Input extends BaseInput,
  Output extends BaseOutput
>
    extends BaseUseCase<Input, Future<Output>> {
  const BaseFutureUseCase();

  Future<Output> execute(Input input) async {
    try {
      if (LogConfig.enableLogUseCaseInput) {
        _safeLog(() => logD('FutureUseCase Input: $input'));
      }
      final output = await buildUseCase(input);
      if (LogConfig.enableLogUseCaseOutput) {
        _safeLog(() => logD('FutureUseCase Output: $output'));
      }

      return output;
    } catch (e) {
      if (LogConfig.enableLogUseCaseError) {
        _safeLog(() => logE('FutureUseCase Error: $e'));
      }

      throw e is AppException
          ? e
          : e is FirebaseException
          ? AppFirebaseException(code: e.code, message: e.message)
          : AppUncaughtException(e);
    }
  }

  void _safeLog(void Function() logFunction) {
    try {
      logFunction();
    } catch (e) {
      // Ignore logging errors to prevent crashes
      // This handles cases where the logger engine is not initialized
    }
  }
}
