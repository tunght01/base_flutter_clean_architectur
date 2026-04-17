import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/usecase/get_initial_app_data_use_case.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_event.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_state.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';

@LazySingleton()
class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc(this._getInitialAppDataUseCase) : super(const AppState()) {
    on<IsLoggedInStatusChanged>(_onIsLoggedInStatusChanged, transformer: log());

    on<AppInitiated>(_onAppInitiated, transformer: log());

    on<UpdateConnectivityType>(
      (event, emit) => emit(state.copyWith(connectivityType: event.value)),
      transformer: log(),
    );

    on<UpdateSavedAccount>(
      (event, emit) => emit(state.copyWith(savedAccount: event.savedAccount)),
      transformer: log(),
    );
  }

  final GetInitialAppDataUseCase _getInitialAppDataUseCase;

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

        emit(state.copyWith(appInitiated: true));
        add(IsLoggedInStatusChanged(isLoggedIn: output.isLoggedIn));
      },
    );
  }
}
