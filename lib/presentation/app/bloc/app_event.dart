import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

abstract class AppEvent extends BaseBlocEvent {
  const AppEvent();
}

class IsLoggedInStatusChanged extends AppEvent {
  final bool isLoggedIn;
  const IsLoggedInStatusChanged({required this.isLoggedIn});
}

class IsGoToNotifyChangedEvent extends AppEvent {
  final bool isGotoNotidy;
  const IsGoToNotifyChangedEvent({required this.isGotoNotidy});
}

class AppThemeChanged extends AppEvent {
  final bool isDarkTheme;
  const AppThemeChanged({required this.isDarkTheme});
}

class UpdateSavedAccount extends AppEvent {
  final bool savedAccount;
  const UpdateSavedAccount({required this.savedAccount});
}

class AppInitiated extends AppEvent {
  const AppInitiated();
}

class UpdateWatchlist extends AppEvent {
  const UpdateWatchlist();
}

class DisconnectSocket extends AppEvent {
  const DisconnectSocket();
}

class ConnectSocket extends AppEvent {
  const ConnectSocket();
}

class UpdateConnectivityType extends AppEvent {
  final List<ConnectivityResult> value;
  const UpdateConnectivityType(this.value);
}

class UpdateStockChangeType extends AppEvent {
  const UpdateStockChangeType();
}

class UpdateAccountSmartOtp extends AppEvent {
  const UpdateAccountSmartOtp();
}

class SetRemoteMessage extends AppEvent {
  final RemoteMessage? value;
  const SetRemoteMessage(this.value);
}
