import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState extends BaseBlocState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    String? email,
    String? password,
    String? initialUsername,
    String? loginError,
    @Default(false) bool showLoginButtonLoading,
    @Default(false) bool isFirstPress,
  }) = _LoginState;
}
