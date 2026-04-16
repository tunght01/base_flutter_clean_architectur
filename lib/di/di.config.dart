// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:soft_dream_test/data/repository/app_repository_impl.dart'
    as _i352;
import 'package:soft_dream_test/data/repository/source/firebase/firebase_auth_datasource.dart'
    as _i1056;
import 'package:soft_dream_test/di/di.dart' as _i570;
import 'package:soft_dream_test/domain/navigation/app_navigator.dart' as _i1042;
import 'package:soft_dream_test/domain/repository/app_repository.dart' as _i141;
import 'package:soft_dream_test/domain/usecase/forgot_password_use_case.dart'
    as _i966;
import 'package:soft_dream_test/domain/usecase/load_initial_resource_use_case.dart'
    as _i982;
import 'package:soft_dream_test/domain/usecase/login_use_case.dart' as _i787;
import 'package:soft_dream_test/domain/usecase/sign_up_use_case.dart' as _i119;
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart' as _i116;
import 'package:soft_dream_test/presentation/base/bloc/common/common_bloc.dart'
    as _i852;
import 'package:soft_dream_test/presentation/navigation/app_navigator_impl.dart'
    as _i34;
import 'package:soft_dream_test/presentation/navigation/base/base_route_info_mapper.dart'
    as _i21;
import 'package:soft_dream_test/presentation/navigation/mapper/app_route_info_mapper.dart'
    as _i878;
import 'package:soft_dream_test/presentation/navigation/middleware/route_guard.dart'
    as _i441;
import 'package:soft_dream_test/presentation/navigation/routes/app_router.dart'
    as _i67;
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_bloc.dart'
    as _i768;
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/bloc/forgot_password_bloc.dart'
    as _i443;
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_bloc.dart'
    as _i4;
import 'package:soft_dream_test/presentation/ui/main/bloc/main_bloc.dart'
    as _i614;
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_bloc.dart'
    as _i673;
import 'package:soft_dream_test/shared/helper/app_info.dart' as _i906;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final serviceModule = _$ServiceModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => serviceModule.prefs,
      preResolve: true,
    );
    gh.factory<_i982.LoadInitialResourceUseCase>(
      () => const _i982.LoadInitialResourceUseCase(),
    );
    gh.factory<_i852.CommonBloc>(() => _i852.CommonBloc());
    gh.factory<_i441.RouteGuard>(() => _i441.RouteGuard());
    gh.factory<_i614.MainBloc>(() => _i614.MainBloc());
    gh.singleton<_i59.FirebaseAuth>(() => serviceModule.fireAuth);
    gh.singleton<_i974.FirebaseFirestore>(
      () => serviceModule.firebaseFirestore,
    );
    gh.lazySingleton<_i116.AppBloc>(() => _i116.AppBloc());
    gh.lazySingleton<_i67.AppRouter>(() => _i67.AppRouter());
    gh.lazySingleton<_i768.AccountInfoBloc>(() => _i768.AccountInfoBloc());
    gh.lazySingleton<_i906.AppInfo>(() => _i906.AppInfo());
    gh.lazySingleton<_i21.BaseRouteInfoMapper>(
      () => _i878.AppRouteInfoMapper(),
    );
    gh.lazySingleton<_i1042.AppNavigator>(
      () => _i34.AppNavigatorImpl(
        gh<_i67.AppRouter>(),
        gh<_i21.BaseRouteInfoMapper>(),
      ),
    );
    gh.lazySingleton<_i1056.FirebaseAuthDatasource>(
      () => _i1056.FirebaseAuthDatasource(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i141.AppRepository>(
      () => _i352.AppRepositoryImpl(gh<_i1056.FirebaseAuthDatasource>()),
    );
    gh.factory<_i966.ForgotPasswordUseCase>(
      () => _i966.ForgotPasswordUseCase(gh<_i141.AppRepository>()),
    );
    gh.factory<_i787.LoginUseCase>(
      () => _i787.LoginUseCase(gh<_i141.AppRepository>()),
    );
    gh.factory<_i119.SignUpUseCase>(
      () => _i119.SignUpUseCase(gh<_i141.AppRepository>()),
    );
    gh.factory<_i4.LoginBloc>(() => _i4.LoginBloc(gh<_i787.LoginUseCase>()));
    gh.factory<_i673.SignUpBloc>(
      () => _i673.SignUpBloc(gh<_i119.SignUpUseCase>()),
    );
    gh.factory<_i443.ForgotPasswordBloc>(
      () => _i443.ForgotPasswordBloc(gh<_i966.ForgotPasswordUseCase>()),
    );
    return this;
  }
}

class _$ServiceModule extends _i570.ServiceModule {}
