import 'package:soft_dream_test/config/log_config.dart';
import 'package:soft_dream_test/domain/repository/auth_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception.dart';
import 'package:soft_dream_test/shared/exception/remote/remote_exception.dart';
import 'package:soft_dream_test/shared/exception/uncaught/app_uncaught_exception.dart';

abstract class BaseCoreFutureUseCase<
  Input extends BaseInput,
  Output extends BaseOutput
>
    extends BaseFutureUseCase<Input, Output> {
  const BaseCoreFutureUseCase(this.repository);
  final AuthRepository repository;

  @override
  Future<Output> execute(Input input) async {
    try {
      //TODO()
      // if (repository.token == null) {
      //   throw const ValidationException(ValidationExceptionKind.notLogin);
      // }
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
      if (e is RemoteException) {
        // TODO('HANDLE SAU')
      }
      throw e is AppException ? e : AppUncaughtException(e);
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
