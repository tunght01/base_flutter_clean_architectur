import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

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

class AppLanguageChanged extends AppEvent {
  final LanguageCode languageCode;
  const AppLanguageChanged({required this.languageCode});
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

class UpdateConnectivityType extends AppEvent {
  final List<ConnectivityResult> value;
  const UpdateConnectivityType(this.value);
}

class SetRemoteMessage extends AppEvent {
  final RemoteMessage? value;
  const SetRemoteMessage(this.value);
}
