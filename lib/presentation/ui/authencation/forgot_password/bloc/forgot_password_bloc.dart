import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/usecase/auth/forgot_password_use_case.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/bloc/forgot_password_event.dart';
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/bloc/forgot_password_state.dart';

@Injectable()
class ForgotPasswordBloc
    extends BaseBloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordBloc(this._forgotPasswordUseCase)
    : super(const ForgotPasswordState()) {
    on<OnPressSendEvent>(_onPressSendEvent, transformer: log());
    on<OnChangeEmailEvent>(_onChangeEmailEvent, transformer: log());
    on<OnFirstSubmitEvent>(
      (event, emit) => emit(state.copyWith(isFirstPress: true)),
      transformer: log(),
    );
  }

  FutureOr<void> _onPressSendEvent(
    OnPressSendEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(error: null, isSuccess: false));
        await _forgotPasswordUseCase.execute(
          ForgotPasswordInput(email: state.email!),
        );
        emit(state.copyWith(isSuccess: true));
      },
      doOnError: (e) async {
        /// map message de show len ui
        emit(state.copyWith(error: exceptionMessageMapper.map(e)));
      },
    );
  }

  FutureOr<void> _onChangeEmailEvent(
    OnChangeEmailEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(email: event.email, error: null, isSuccess: false));
  }
}
