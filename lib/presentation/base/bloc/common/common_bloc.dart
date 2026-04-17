import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_event.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_state.dart';
import 'package:soft_dream_test/presentation/common_view/snackbar/app_snackbar_content.dart';
import 'package:soft_dream_test/presentation/utils/snackbar_enum.dart';
import 'package:soft_dream_test/shared/utils/num_utils.dart';

@Injectable()
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  CommonBloc() : super(const CommonState()) {
    on<LoadingVisibilityEmitted>(
      _onLoadingVisibilityEmitted,
      transformer: log(),
    );

    on<ExceptionEmitted>(_onExceptionEmitted, transformer: log());

    on<ForceLogoutButtonPressed>(
      _onForceLogoutButtonPressed,
      transformer: log(),
    );
    on<SnackbarEmitted>(_onSnackbarEmitted, transformer: log());
    on<SnackbarShowOff>(_onSnackbarShowOff, transformer: log());
    on<SnackbarExceptionEmitted>(
      _onSnackbarExceptionEmitted,
      transformer: log(),
    );
    on<SnackbarSuccessEmitted>(_onSnackbarSuccessEmitted, transformer: log());
  }

  FutureOr<void> _onLoadingVisibilityEmitted(
    LoadingVisibilityEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: state.loadingCount == 0 && event.isLoading
            ? true
            : state.loadingCount == 1 && !event.isLoading ||
                  state.loadingCount <= 0
            ? false
            : state.isLoading,
        loadingCount: event.isLoading
            ? state.loadingCount.plus(1)
            : state.loadingCount.minus(1),
      ),
    );
  }

  FutureOr<void> _onExceptionEmitted(
    ExceptionEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(appExceptionWrapper: event.appExceptionWrapper));
  }

  FutureOr<void> _onForceLogoutButtonPressed(
    ForceLogoutButtonPressed event,
    Emitter<CommonState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await navigator.handleRequiredLogin();
      },
    );
  }

  FutureOr<void> _onSnackbarEmitted(
    SnackbarEmitted event,
    Emitter<CommonState> emit,
  ) {
    final snackbarContent = AppSnackbarContent(
      message: event.message,
      snackbarType: event.snackbarType,
    );
    emit(
      state.copyWith(
        snackbarContents: List.from(state.snackbarContents)
          ..add(snackbarContent),
      ),
    );
  }

  FutureOr<void> _onSnackbarShowOff(
    SnackbarShowOff event,
    Emitter<CommonState> emit,
  ) {
    emit(
      state.copyWith(
        snackbarContents: List.from(state.snackbarContents)..removeAt(0),
      ),
    );
  }

  FutureOr<void> _onSnackbarExceptionEmitted(
    SnackbarExceptionEmitted event,
    Emitter<CommonState> emit,
  ) {
    add(
      SnackbarEmitted(snackbarType: SnackbarType.error, message: event.message),
    );
  }

  FutureOr<void> _onSnackbarSuccessEmitted(
    SnackbarSuccessEmitted event,
    Emitter<CommonState> emit,
  ) {
    add(
      SnackbarEmitted(
        snackbarType: SnackbarType.success,
        message: event.message,
      ),
    );
  }
}
