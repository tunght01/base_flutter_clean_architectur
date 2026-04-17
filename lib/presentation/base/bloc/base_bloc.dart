import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_bloc.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_event.dart';
import 'package:soft_dream_test/presentation/base/bloc/mixin/event_transformer_mixin.dart';
import 'package:soft_dream_test/presentation/exception_handler/exception_handler.dart';
import 'package:soft_dream_test/presentation/exception_handler/exception_message_mapper.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception_wrapper.dart';
import 'package:soft_dream_test/shared/exception/remote/remote_exception.dart';
import 'package:soft_dream_test/shared/exception/validation/validation_exception.dart';
import 'package:soft_dream_test/shared/helper/stream/dispose_bag.dart';
import 'package:soft_dream_test/shared/mixin/log_mixin.dart';
import 'package:soft_dream_test/shared/utils/log_utils.dart';
import 'package:soft_dream_test/shared/utils/num_utils.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S>
    with EventTransformerMixin, LogMixin {
  BaseBloc(super.initialState);
}

abstract class BaseBlocDelegate<
  E extends BaseBlocEvent,
  S extends BaseBlocState
>
    extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  late final AppNavigator navigator;
  late final AppBloc appBloc;
  late final ExceptionHandler exceptionHandler;
  late final ExceptionMessageMapper exceptionMessageMapper;
  late final DisposeBag disposeBag;
  late final CommonBloc _commonBloc;
  void Function(BaseBlocEvent)? onBlocEvent;
  set commonBloc(CommonBloc commonBloc) {
    _commonBloc = commonBloc;
  }

  bool lateInitialization = false;

  CommonBloc get commonBloc =>
      this is CommonBloc ? this as CommonBloc : _commonBloc;

  void setParamBloc({
    required AppNavigator navigator,
    required AppBloc appBloc,
    required ExceptionHandler exceptionHandler,
    required ExceptionMessageMapper exceptionMessageMapper,
    required DisposeBag disposeBag,
    CommonBloc? commonBloc,
    Function(BaseBlocEvent)? onBlocEvent,
  }) {
    if (!lateInitialization) {
      lateInitialization = true;
      this.navigator = navigator;
      this.appBloc = appBloc;
      this.exceptionHandler = exceptionHandler;
      this.exceptionMessageMapper = exceptionMessageMapper;
      this.disposeBag = disposeBag;
      if (commonBloc != null) {
        _commonBloc = commonBloc;
      }
      if (onBlocEvent != null) {
        this.onBlocEvent = onBlocEvent;
      }
    }
  }

  @override
  void onEvent(E event) {
    super.onEvent(event);
    onBlocEvent?.call(event);
  }

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      Log.e('Cannot add new event $event because $runtimeType was closed');
    }
  }

  Future<void> addException(AppExceptionWrapper appExceptionWrapper) async {
    commonBloc.add(ExceptionEmitted(appExceptionWrapper: appExceptionWrapper));

    return appExceptionWrapper.exceptionCompleter?.future;
  }

  void showLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: true));
  }

  void hideLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: false));
  }

  Future<void> runBlocCatching({
    required Future<void> Function() action,
    Future<void> Function()? doOnRetry,
    Future<void> Function(AppException)? doOnError,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
    Future<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
    bool handleError = false,
    bool handleRetry = false,
    bool Function(AppException)? forceHandleError,
    String? overrideErrorMessage,
    int? maxRetries,
  }) async {
    assert(maxRetries == null || maxRetries > 0, 'maxRetries must be positive');
    Completer<void>? recursion;
    try {
      await doOnSubscribe?.call();
      if (handleLoading) {
        showLoading();
      }

      await action.call();

      if (handleLoading) {
        hideLoading();
      }
      await doOnSuccessOrError?.call();
    } on AppException catch (e) {
      if (handleLoading) {
        hideLoading();
      }
      if (e is ValidationException &&
          (e.kind == ValidationExceptionKind.logOut ||
              e.kind == ValidationExceptionKind.notLogin)) {
        addException(
          AppExceptionWrapper(
            appException: e,
            exceptionCompleter: Completer<void>()
              ..future.then((_) async {
                navigator.replaceAll([const AppRouteInfo.login()]);
              }),
            overrideMessage: overrideErrorMessage,
          ),
        );
      }

      await doOnSuccessOrError?.call();
      await doOnError?.call(e);

      if (handleError || (forceHandleError?.call(e) ?? _forceHandleError(e))) {
        await addException(
          AppExceptionWrapper(
            appException: e,
            doOnRetry:
                doOnRetry ??
                (handleRetry && maxRetries != 1
                    ? () async {
                        recursion = Completer();
                        await runBlocCatching(
                          action: action,
                          doOnEventCompleted: doOnEventCompleted,
                          doOnSubscribe: doOnSubscribe,
                          doOnSuccessOrError: doOnSuccessOrError,
                          doOnError: doOnError,
                          doOnRetry: doOnRetry,
                          forceHandleError: forceHandleError,
                          handleError: handleError,
                          handleLoading: handleLoading,
                          handleRetry: handleRetry,
                          overrideErrorMessage: overrideErrorMessage,
                          maxRetries: maxRetries?.minus(1),
                        );
                        recursion?.complete();
                      }
                    : null),
            exceptionCompleter: Completer<void>(),
            overrideMessage: overrideErrorMessage,
          ),
        );
      }
    } finally {
      await recursion?.future;
      await doOnEventCompleted?.call();
    }
  }

  Future<void> runBlocCatchingLoggedIn({
    required Future<void> Function() action,
    Future<void> Function()? doOnRetry,
    Future<void> Function(AppException)? doOnError,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
    Future<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
    bool handleError = false,
    bool handleRetry = false,
    bool Function(AppException)? forceHandleError,
    String? overrideErrorMessage,
    int? maxRetries,
  }) async {
    if (!getIt.get<AppBloc>().state.isLoggedIn) {
      return;
    }
    assert(maxRetries == null || maxRetries > 0, 'maxRetries must be positive');
    Completer<void>? recursion;
    try {
      await doOnSubscribe?.call();
      if (handleLoading) {
        showLoading();
      }

      await action.call();

      if (handleLoading) {
        hideLoading();
      }
      await doOnSuccessOrError?.call();
    } on AppException catch (e) {
      if (handleLoading) {
        hideLoading();
      }
      if (e is ValidationException &&
          (e.kind == ValidationExceptionKind.logOut ||
              e.kind == ValidationExceptionKind.notLogin)) {
        addException(
          AppExceptionWrapper(
            appException: e,
            // exceptionCompleter: Completer<void>()
            //   ..future.then((_) async {
            //     await navigator.replace(const AppRouteInfo.login());
            //   }),
            overrideMessage: overrideErrorMessage,
          ),
        );
      }

      await doOnSuccessOrError?.call();
      await doOnError?.call(e);

      if (handleError || (forceHandleError?.call(e) ?? _forceHandleError(e))) {
        await addException(
          AppExceptionWrapper(
            appException: e,
            doOnRetry:
                doOnRetry ??
                (handleRetry && maxRetries != 1
                    ? () async {
                        recursion = Completer();
                        await runBlocCatching(
                          action: action,
                          doOnEventCompleted: doOnEventCompleted,
                          doOnSubscribe: doOnSubscribe,
                          doOnSuccessOrError: doOnSuccessOrError,
                          doOnError: doOnError,
                          doOnRetry: doOnRetry,
                          forceHandleError: forceHandleError,
                          handleError: handleError,
                          handleLoading: handleLoading,
                          handleRetry: handleRetry,
                          overrideErrorMessage: overrideErrorMessage,
                          maxRetries: maxRetries?.minus(1),
                        );
                        recursion?.complete();
                      }
                    : null),
            exceptionCompleter: Completer<void>(),
            overrideMessage: overrideErrorMessage,
          ),
        );
      }
    } finally {
      await recursion?.future;
      await doOnEventCompleted?.call();
    }
  }

  bool _forceHandleError(AppException appException) {
    return appException is RemoteException &&
        appException.kind == RemoteExceptionKind.refreshTokenFailed;
  }
}
