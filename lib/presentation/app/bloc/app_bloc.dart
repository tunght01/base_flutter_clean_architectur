import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/usecase/get_initial_app_data_use_case.dart';
import 'package:soft_dream_test/domain/usecase/save_dark_mode_use_case.dart';
import 'package:soft_dream_test/domain/usecase/save_language_app_use_case.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_event.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_state.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';

@LazySingleton()
class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc(
    this._getInitialAppDataUseCase,
    this._saveDarkModeUseCase,
    this._saveLanguageAppUseCase,
  ) : super(const AppState()) {
    on<IsLoggedInStatusChanged>(_onIsLoggedInStatusChanged, transformer: log());

    on<AppInitiated>(_onAppInitiated, transformer: log());

    on<UpdateConnectivityType>(
      (event, emit) => emit(state.copyWith(connectivityType: event.value)),
      transformer: log(),
    );
    on<IsGoToNotifyChangedEvent>(
      (event, emit) => emit(state.copyWith(isGoToNotify: event.isGotoNotidy)),
      transformer: log(),
    );
    on<SetRemoteMessage>(_onSetRemoteMessage, transformer: log());

    on<UpdateSavedAccount>(
      (event, emit) => emit(state.copyWith(savedAccount: event.savedAccount)),
      transformer: log(),
    );

    on<AppThemeChanged>(_onAppThemeChanged, transformer: log());
    on<AppLanguageChanged>(_onLanguageChanged, transformer: log());
  }
  final GetInitialAppDataUseCase _getInitialAppDataUseCase;
  final SaveDarkModeUseCase _saveDarkModeUseCase;
  final SaveLanguageAppUseCase _saveLanguageAppUseCase;

  void _onIsLoggedInStatusChanged(
    IsLoggedInStatusChanged event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(isLoggedIn: event.isLoggedIn));
  }

  Future<void> _onAppInitiated(
    AppInitiated event,
    Emitter<AppState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final output = await _getInitialAppDataUseCase.execute(
          const GetInitialAppDataInput(),
        );

        emit(
          state.copyWith(
            appInitiated: true,
            isDarkTheme: output.isDarkMode,
            languageCode: output.languageCode,
          ),
        );

        /// emit trang thai de navigate den man home
        add(IsLoggedInStatusChanged(isLoggedIn: output.isLoggedIn));
      },
    );
  }

  FutureOr<void> _onSetRemoteMessage(
    SetRemoteMessage event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(remoteMessage: event.value));
  }

  Future<void> _onLanguageChanged(
    AppLanguageChanged event,
    Emitter<AppState> emit,
  ) async {
    await S.load(Locale(event.languageCode.localeCode));
    emit(state.copyWith(languageCode: event.languageCode));
    _saveLanguageAppUseCase.execute(
      SaveLanguageAppInput(languageApp: event.languageCode.localeCode),
    );
  }

  FutureOr<void> _onAppThemeChanged(
    AppThemeChanged event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(isDarkTheme: event.isDarkTheme));
    _saveDarkModeUseCase.execute(
      SaveDarkModeInput(isDarkMode: event.isDarkTheme),
    );
  }
}
