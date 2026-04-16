import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/usecase/sign_up_use_case.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_event.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_state.dart';

@Injectable()
class SignUpBloc extends BaseBloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  SignUpBloc(this._signUpUseCase) : super(const SignUpState()) {
    on<OnPressSignUpEvent>(_onPressSignUpEvent, transformer: log());
    on<OnChangeSignUpEmailEvent>(_onChangeEmailEvent, transformer: log());
    on<OnChangeSignUpPasswordEvent>(_onChangePasswordEvent, transformer: log());
    on<OnChangeSignUpConfirmPasswordEvent>(
      _onChangeConfirmPasswordEvent,
      transformer: log(),
    );
    on<OnChangeSignUpFirstSubmitEvent>(
      (event, emit) => emit(state.copyWith(isFirstPress: true)),
      transformer: log(),
    );
  }

  FutureOr<void> _onPressSignUpEvent(
    OnPressSignUpEvent event,
    Emitter<SignUpState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(signUpError: null));
        await _signUpUseCase.execute(
          SignUpInput(email: state.email!, password: state.password!),
        );
      },
      doOnError: (e) async {
        emit(state.copyWith(signUpError: exceptionMessageMapper.map(e)));
      },
    );
  }

  FutureOr<void> _onChangeEmailEvent(
    OnChangeSignUpEmailEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(email: event.email, signUpError: null));
  }

  FutureOr<void> _onChangePasswordEvent(
    OnChangeSignUpPasswordEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(password: event.password, signUpError: null));
  }

  FutureOr<void> _onChangeConfirmPasswordEvent(
    OnChangeSignUpConfirmPasswordEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copyWith(confirmPassword: event.confirmPassword, signUpError: null),
    );
  }
}
