import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';


part 'app_state.freezed.dart';

@freezed
abstract class AppState extends BaseBlocState with _$AppState {
  const AppState._();
  const factory AppState({
    RemoteMessage? remoteMessage,
    @Default(false) bool appInitiated,
    @Default(false) bool isLoggedIn,
    @Default(false) bool savedAccount,
    @Default(false) bool isDarkTheme,
    @Default(LanguageCode.vi) LanguageCode languageCode,
    @Default([]) List<ConnectivityResult> connectivityType,
  }) = _AppState;
}
