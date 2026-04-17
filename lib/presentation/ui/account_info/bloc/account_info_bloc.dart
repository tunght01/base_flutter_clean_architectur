import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/domain/usecase/auth/logout_use_case.dart';
import 'package:soft_dream_test/domain/usecase/cloud/get_user_profile_use_case.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_event.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/helper/local_push_notification_helper.dart';
import 'package:soft_dream_test/presentation/navigation/routes/app_router.gr.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_event.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_state.dart';
import 'package:soft_dream_test/presentation/utils/device_utils.dart';

@LazySingleton()
class AccountInfoBloc extends BaseBloc<AccountInfoEvent, AccountInfoState> {
  AccountInfoBloc(this._getUserProfileUseCase, this._logoutUseCase) : super(const AccountInfoState()) {
    on<AccountInfoInitEvent>(_onAccountInfoEvent, transformer: log());
    on<PressedLogout>(_onPressedLogoutEvent, transformer: log());
    on<RemoveDataAfterLogout>(_onRemoveDataAfterLogout, transformer: log());

    navigator = getIt.get();
    appBloc = getIt.get();
  }
  final GetUserProfileUseCase _getUserProfileUseCase;
  final LogoutUseCase _logoutUseCase;

  FutureOr<void> _onAccountInfoEvent(AccountInfoInitEvent event, Emitter<AccountInfoState> emit) {
    return runBlocCatching(
      handleLoading: false,
      action: () async {
        if (navigator.canPopSelfOrChildren) {
          navigator.popUntilRouteName(MainRoute.name);
        } else {
          unawaited(navigator.replace(const AppRouteInfo.main()));
        }

        final response = await _getUserProfileUseCase.execute(GetUserProfileInput());
        emit(state.copyWith(accountInfo: response.accountInfo));

        if (DeviceUtils.isMobile()) {
          final LocalPushNotificationHelper localPushNotification = getIt.get<LocalPushNotificationHelper>();
          await localPushNotification.getToken();

          /// xu ly remote message nhan khi chua dang nhap
          RemoteMessage? message;
          message = await localPushNotification.getInitialMessage() ?? appBloc.state.remoteMessage;

          if (message != null) {
            await localPushNotification.handleNotification(message);
            appBloc.add(const SetRemoteMessage(null));
            appBloc.add(const IsGoToNotifyChangedEvent(isGotoNotidy: false));
          }
        }
      },
    );
  }

  FutureOr<void> _onPressedLogoutEvent(PressedLogout event, Emitter<AccountInfoState> emit) async {
    getIt.get<AppBloc>().add(const IsLoggedInStatusChanged(isLoggedIn: false));
    await _logoutUseCase.execute(LogoutInput(event.logoutAll));
  }

  FutureOr<void> _onRemoveDataAfterLogout(RemoveDataAfterLogout event, Emitter<AccountInfoState> emit) {}
}
