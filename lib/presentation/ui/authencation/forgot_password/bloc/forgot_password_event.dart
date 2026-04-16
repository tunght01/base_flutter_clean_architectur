import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

abstract class ForgotPasswordEvent extends BaseBlocEvent {
  const ForgotPasswordEvent();
}

class OnPressSendEvent extends ForgotPasswordEvent {
  const OnPressSendEvent();
}

class OnChangeEmailEvent extends ForgotPasswordEvent {
  final String? email;
  const OnChangeEmailEvent({required this.email});
}

class OnFirstSubmitEvent extends ForgotPasswordEvent {
  const OnFirstSubmitEvent();
}
