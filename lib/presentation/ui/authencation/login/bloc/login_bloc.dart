import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/domain/usecase/auth/login_use_case.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_event.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_event.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_state.dart';

@Injectable()
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(const LoginState()) {
    on<OnPressEvent>(_onPressEvent, transformer: log());
    on<OnChangeEmailEvent>(_onChangeEmailEvent, transformer: log());
    on<OnChangePasswordEvent>(_onChangePasswordEvent, transformer: log());
    on<OnChangeFirstSubmitEvent>(
      (event, emit) => emit(state.copyWith(isFirstPress: true)),
      transformer: log(),
    );
  }

  FutureOr<void> _onPressEvent(OnPressEvent event, Emitter<LoginState> emit) {
    return runBlocCatching(
      handleError: true,
      action: () async {
        emit(state.copyWith(loginError: null));
        await _loginUseCase.execute(
          LoginInput(email: state.email!, password: state.password!),
        );
        appBloc.add(const IsLoggedInStatusChanged(isLoggedIn: true));
      },
    );
  }

  FutureOr<void> _onChangeEmailEvent(
    OnChangeEmailEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email, loginError: null));
  }

  FutureOr<void> _onChangePasswordEvent(
    OnChangePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password, loginError: null));
  }
}
