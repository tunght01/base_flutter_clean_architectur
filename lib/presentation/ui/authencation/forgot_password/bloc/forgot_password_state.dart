import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';

part 'forgot_password_state.freezed.dart';

@freezed
abstract class ForgotPasswordState extends BaseBlocState
    with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    String? email,
    @Default(false) bool isFirstPress,
    @Default(false) bool isSuccess,
    String? error,
  }) = _ForgotPasswordState;

  const ForgotPasswordState._();
}
