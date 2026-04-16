import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';

part 'sign_up_state.freezed.dart';

@freezed
abstract class SignUpState extends BaseBlocState with _$SignUpState {
  const SignUpState._();
  const factory SignUpState({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
    @Default(false) bool isFirstPress,
    @Default(false) bool isAgreePolicy,
    String? signUpError,
  }) = _SignUpState;
}
