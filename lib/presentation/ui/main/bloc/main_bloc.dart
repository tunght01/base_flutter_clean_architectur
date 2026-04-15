import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'main.dart';

@Injectable()
class MainBloc extends BaseBloc<MainEvent, MainState> {
  MainBloc(
  ) : super(const MainState()) {
    on<MainPageInitiated>(
      _onMainPageInitiated,
      transformer: log(),
    );
  }

  FutureOr<void> _onMainPageInitiated(MainPageInitiated event, Emitter<MainState> emit) {
    // final appSupported = _doesAppSupportMestricUseCase
    //     .execute(const DoesAppSupportMestricUseCaseInput());
    // final registered = _biomestricRegisteredUseCase
    //     .execute(const BiomestricRegisteredUseCaseInput());
    // if (appSupported.supported && !registered.registered) {
    //   navigator
    //       .showDialog(AppPopupInfo.infoDialog(
    //           message: S.current.biometric_authentication))
    //       .then((value) {
    //     if (value == true) {
    //       _registerBioMestricUseCase
    //           .execute(const RegisterBioMestricUseCaseInput());
    //     }
    //   });
    // }
  }
}
