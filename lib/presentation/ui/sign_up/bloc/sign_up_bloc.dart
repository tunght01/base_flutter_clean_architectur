import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/request/create_user_request.dart';
import 'package:soft_dream_test/domain/usecase/auth/sign_up_use_case.dart';
import 'package:soft_dream_test/domain/usecase/cloud/save_user_profile_use_case.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_event.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_state.dart';

@Injectable()
class SignUpBloc extends BaseBloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final SaveUserProfileUseCase _saveUserProfileUseCase;
  SignUpBloc(this._signUpUseCase, this._saveUserProfileUseCase)
    : super(const SignUpState()) {
    on<OnPressSignUpEvent>(_onPressSignUpEvent, transformer: log());
    on<OnChangeSignUpEmailEvent>(
      _onChangeEmailEvent,
      transformer: debounceTime(),
    );
    on<OnChangeSignUpPasswordEvent>(
      _onChangePasswordEvent,
      transformer: debounceTime(),
    );
    on<OnChangeSignUpConfirmPasswordEvent>(
      _onChangeConfirmPasswordEvent,
      transformer: debounceTime(),
    );
    on<OnChangeSignUpFirstSubmitEvent>(
      (event, emit) => emit(state.copyWith(isFirstPress: true)),
      transformer: log(),
    );
    on<OnChangeAgreePoicyEvent>(
      (event, emit) => emit(state.copyWith(isAgreePolicy: event.value)),
      transformer: log(),
    );
    on<OnFullNameChangedEvent>(
      (event, emit) => emit(state.copyWith(fullName: event.value)),
      transformer: debounceTime(),
    );
    on<SaveUserProfileEvent>(_onSaveUserProfileEvent, transformer: log());
  }

  FutureOr<void> _onPressSignUpEvent(
    OnPressSignUpEvent event,
    Emitter<SignUpState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(signUpError: null));
        if (!state.isAgreePolicy) {
          navigator.showWarningSnackBar(S.current.please_agree_term_policy);
          return;
        }

        /// dang ky tai khoan
        await _signUpUseCase.execute(
          SignUpInput(
            email: state.email!,
            password: state.password!,
            fullName: state.fullName!,
          ),
        );
        add(SaveUserProfileEvent());
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

  FutureOr<void> _onSaveUserProfileEvent(
    SaveUserProfileEvent event,
    Emitter<SignUpState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        /// sau khi dang ki thanh cong cap nhat luu duu lieu user len firebase store
        await _saveUserProfileUseCase.execute(
          SaveUserProfileInput(
            createUserRequest: CreateUserRequest(
              email: state.email!,
              fullName: state.fullName!,
              uid: '',
              emailVerified: false,
            ),
          ),
        );
        navigator.showSuccessSnackBar(S.current.sign_up_success);
        navigator.pop();
      },
      doOnError: (e) async {
        emit(state.copyWith(signUpError: exceptionMessageMapper.map(e)));
      },
    );
  }
}
