import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'main.dart';

@Injectable()
class MainBloc extends BaseBloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainPageInitiated>(_onMainPageInitiated, transformer: log());
    on<ChangeTabIndexEvent>(_onChangeTabIndexEvent, transformer: log());
  }

  FutureOr<void> _onMainPageInitiated(
    MainPageInitiated event,
    Emitter<MainState> emit,
  ) {}

  void _onChangeTabIndexEvent(
    ChangeTabIndexEvent event,
    Emitter<MainState> emit,
  ) {
    emit(state.copyWith(tabIndex: event.index));
  }
}
