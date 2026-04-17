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
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:soft_dream_test/data/repository/auth_repository_impl.dart'
    as _i1052;
import 'package:soft_dream_test/data/repository/source/firebase/auth_datasource.dart'
    as _i704;
import 'package:soft_dream_test/data/repository/source/firebase/cloud_store_data_source.dart'
    as _i675;
import 'package:soft_dream_test/data/repository/store_repository_impl.dart'
    as _i811;
import 'package:soft_dream_test/di/di.dart' as _i570;
import 'package:soft_dream_test/domain/mapper/account_info_mapper.dart'
    as _i829;
import 'package:soft_dream_test/domain/navigation/app_navigator.dart' as _i1042;
import 'package:soft_dream_test/domain/repository/auth_repository.dart'
    as _i146;
import 'package:soft_dream_test/domain/repository/store_repository.dart'
    as _i15;
import 'package:soft_dream_test/domain/usecase/auth/forgot_password_use_case.dart'
    as _i1071;
import 'package:soft_dream_test/domain/usecase/auth/login_use_case.dart'
    as _i68;
import 'package:soft_dream_test/domain/usecase/auth/sign_up_use_case.dart'
    as _i515;
import 'package:soft_dream_test/domain/usecase/cloud/get_user_profile_use_case.dart'
    as _i105;
import 'package:soft_dream_test/domain/usecase/cloud/save_user_profile_use_case.dart'
    as _i166;
import 'package:soft_dream_test/domain/usecase/load_initial_resource_use_case.dart'
    as _i982;
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
    gh.factory<_i829.AccountInfoMapper>(() => const _i829.AccountInfoMapper());
    gh.factory<_i982.LoadInitialResourceUseCase>(
      () => const _i982.LoadInitialResourceUseCase(),
    );
    gh.factory<_i852.CommonBloc>(() => _i852.CommonBloc());
    gh.factory<_i441.RouteGuard>(() => _i441.RouteGuard());
    gh.factory<_i614.MainBloc>(() => _i614.MainBloc());
    gh.lazySingleton<_i59.FirebaseAuth>(() => serviceModule.fireAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => serviceModule.fireStore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => serviceModule.google);
    gh.lazySingleton<_i116.AppBloc>(() => _i116.AppBloc());
    gh.lazySingleton<_i67.AppRouter>(() => _i67.AppRouter());
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
    gh.lazySingleton<_i675.CloudStoreDataSource>(
      () => _i675.CloudStoreDataSource(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i704.AuthDatasource>(
      () => _i704.AuthDatasource(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i15.StoreRepository>(
      () => _i811.StoreRepositoryImpl(
        gh<_i704.AuthDatasource>(),
        gh<_i829.AccountInfoMapper>(),
        gh<_i675.CloudStoreDataSource>(),
      ),
    );
    gh.lazySingleton<_i146.AuthRepository>(
      () => _i1052.AuthRepositoryImpl(gh<_i704.AuthDatasource>()),
    );
    gh.factory<_i105.GetUserProfileUseCase>(
      () => _i105.GetUserProfileUseCase(gh<_i15.StoreRepository>()),
    );
    gh.factory<_i166.SaveUserProfileUseCase>(
      () => _i166.SaveUserProfileUseCase(gh<_i15.StoreRepository>()),
    );
    gh.factory<_i515.SignUpUseCase>(
      () => _i515.SignUpUseCase(gh<_i146.AuthRepository>()),
    );
    gh.factory<_i1071.ForgotPasswordUseCase>(
      () => _i1071.ForgotPasswordUseCase(gh<_i146.AuthRepository>()),
    );
    gh.factory<_i68.LoginUseCase>(
      () => _i68.LoginUseCase(gh<_i146.AuthRepository>()),
    );
    gh.lazySingleton<_i768.AccountInfoBloc>(
      () => _i768.AccountInfoBloc(gh<_i105.GetUserProfileUseCase>()),
    );
    gh.factory<_i4.LoginBloc>(() => _i4.LoginBloc(gh<_i68.LoginUseCase>()));
    gh.factory<_i673.SignUpBloc>(
      () => _i673.SignUpBloc(
        gh<_i515.SignUpUseCase>(),
        gh<_i166.SaveUserProfileUseCase>(),
      ),
    );
    gh.factory<_i443.ForgotPasswordBloc>(
      () => _i443.ForgotPasswordBloc(gh<_i1071.ForgotPasswordUseCase>()),
    );
    return this;
  }
}

class _$ServiceModule extends _i570.ServiceModule {}
