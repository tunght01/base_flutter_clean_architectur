import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/domain/usecase/cloud/get_user_profile_use_case.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/navigation/routes/app_router.gr.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_event.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_state.dart';

@LazySingleton()
class AccountInfoBloc extends BaseBloc<AccountInfoEvent, AccountInfoState> {
  AccountInfoBloc(this._getUserProfileUseCase)
    : super(const AccountInfoState()) {
    on<AccountInfoEvent>(_onAccountInfoEvent, transformer: log());

    navigator = getIt.get();
    appBloc = getIt.get();
  }
  final GetUserProfileUseCase _getUserProfileUseCase;
  FutureOr<void> _onAccountInfoEvent(
    AccountInfoEvent event,
    Emitter<AccountInfoState> emit,
  ) {
    if (navigator.canPopSelfOrChildren) {
      navigator.popUntilRouteName(MainRoute.name);
    } else {
      unawaited(navigator.replace(const AppRouteInfo.main()));
    }

    final response = _getUserProfileUseCase.execute(
      GetUserProfileInput(uid: 'iFmal3BJFagZy09ROZZNRD9a4k72'),
    );
  }
}
