// import 'package:shared/shared.dart';
//
// import '../../../../domain.dart';
//
// abstract class BaseStreamUseCase<Input extends BaseInput, Output>
//     extends BaseUseCase<Input, Stream<Output>> {
//   const BaseStreamUseCase();
//
//   Stream<Output> execute(Input input) {
//     return buildUseCase(input).log(runtimeType.toString());
//   }
// }

import 'package:soft_dream_test/config/log_config.dart';
import 'package:soft_dream_test/domain/usecase/base/base_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception.dart';
import 'package:soft_dream_test/shared/exception/uncaught/app_uncaught_exception.dart';

abstract class BaseStreamUseCase<Input extends BaseInput, Output>
    extends BaseUseCase<Input, Stream<Output?>> {
  const BaseStreamUseCase();

  Stream<Output?> execute(Input input) {
    try {
      if (LogConfig.enableLogUseCaseInput) {
        _safeLog(() => logD('StreamUseCase Input: $input'));
      }

      final stream = buildUseCase(input);

      return stream.map((output) {
        if (LogConfig.enableLogUseCaseOutput) {
          _safeLog(() => logD('StreamUseCase Output: $output'));
        }
        return output;
      }).handleError((e, stackTrace) {
        if (LogConfig.enableLogUseCaseError) {
          _safeLog(() => logE('StreamUseCase Error: $e'));
        }
        throw e is AppException ? e : AppUncaughtException(e);
      });
    } catch (e) {
      return Stream.error(e is AppException ? e : AppUncaughtException(e));
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
  Stream<Output?> buildUseCase(Input input);
}
