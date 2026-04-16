import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

abstract class SignUpEvent extends BaseBlocEvent {
  const SignUpEvent();
}

class OnPressSignUpEvent extends SignUpEvent {
  const OnPressSignUpEvent();
}

class OnChangeSignUpEmailEvent extends SignUpEvent {
  final String? email;
  const OnChangeSignUpEmailEvent({this.email});
}

class OnFullNameChangedEvent extends SignUpEvent {
  final String? value;
  const OnFullNameChangedEvent({this.value});
}

class OnChangeSignUpPasswordEvent extends SignUpEvent {
  final String? password;
  const OnChangeSignUpPasswordEvent({this.password});
}

class OnChangeSignUpConfirmPasswordEvent extends SignUpEvent {
  final String? confirmPassword;
  const OnChangeSignUpConfirmPasswordEvent({this.confirmPassword});
}

class OnChangeSignUpFirstSubmitEvent extends SignUpEvent {
  const OnChangeSignUpFirstSubmitEvent();
}

class OnChangeAgreePoicyEvent extends SignUpEvent {
  final bool value;
  const OnChangeAgreePoicyEvent({required this.value});
}
