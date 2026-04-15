import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

class LoginEvent extends BaseBlocEvent {}

class OnPressEvent extends LoginEvent {}

class OnChangeEmailEvent extends LoginEvent {
  final String? email;

  OnChangeEmailEvent({this.email});
}

class OnChangePasswordEvent extends LoginEvent {
  final String? password;

  OnChangePasswordEvent({this.password});
}
