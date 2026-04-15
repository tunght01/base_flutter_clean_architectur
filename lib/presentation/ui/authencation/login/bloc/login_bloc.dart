import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/usecase/login_use_case.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_event.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_state.dart';

@Injectable()
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(const LoginState()) {
    on<OnPressEvent>(_onPressEvent, transformer: log());
  }

  FutureOr<void> _onPressEvent(OnPressEvent event, Emitter<LoginState> emit) {}
}
