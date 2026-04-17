import 'package:soft_dream_test/config/log_config.dart';
import 'package:soft_dream_test/domain/usecase/base/base_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception.dart';
import 'package:soft_dream_test/shared/exception/uncaught/app_uncaught_exception.dart';

abstract class BaseVoidUseCase<Input extends BaseInput>
    extends BaseUseCase<Input, void> {
  const BaseVoidUseCase();

  Future<void> execute(Input input) async {
    try {
      if (LogConfig.enableLogUseCaseInput) {
        _safeLog(() => logD('VoidUseCase Input: $input'));
      }

      await buildUseCase(input);

      if (LogConfig.enableLogUseCaseOutput) {
        _safeLog(() => logD('VoidUseCase Output: void'));
      }
    } catch (e, stackTrace) {
      if (LogConfig.enableLogUseCaseError) {
        _safeLog(() => logE('VoidUseCase Error: $e\n$stackTrace'));
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

  @override
  Future<void> buildUseCase(Input input);
}
