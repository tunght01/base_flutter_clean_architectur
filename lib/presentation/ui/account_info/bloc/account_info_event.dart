import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

class AccountInfoEvent extends BaseBlocEvent {
  const AccountInfoEvent();
}

class AccountInfoInitEvent extends AccountInfoEvent {
  const AccountInfoInitEvent();
}

class RemoveDataAfterLogout extends AccountInfoEvent {
  const RemoveDataAfterLogout();
}

class PressedLogout extends AccountInfoEvent {
  final bool logoutAll;
  const PressedLogout([this.logoutAll = false]);
}