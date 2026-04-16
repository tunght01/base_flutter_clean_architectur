import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

abstract class LoginEvent extends BaseBlocEvent {
  const LoginEvent();
}

class OnPressEvent extends LoginEvent {
  const OnPressEvent();
}

class OnChangeEmailEvent extends LoginEvent {
  final String? email;
  const OnChangeEmailEvent({this.email});
}

class OnChangePasswordEvent extends LoginEvent {
  final String? password;
  const OnChangePasswordEvent({this.password});
}

class OnChangeFirstSubmitEvent extends LoginEvent {
  const OnChangeFirstSubmitEvent();
}
