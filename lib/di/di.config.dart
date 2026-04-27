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
import 'package:hive_ce_flutter/hive_ce_flutter.dart' as _i965;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:soft_dream_test/data/mapper/account_info_mapper.dart' as _i766;
import 'package:soft_dream_test/data/mapper/product_mapper.dart' as _i953;
import 'package:soft_dream_test/data/mapper/storage/language_code_data_mapper.dart'
    as _i556;
import 'package:soft_dream_test/data/repository/auth_repository_impl.dart'
    as _i1052;
import 'package:soft_dream_test/data/repository/product_repository_impl.dart'
    as _i993;
import 'package:soft_dream_test/data/repository/source/database/hive/model/product_hive_model.dart'
    as _i622;
import 'package:soft_dream_test/data/repository/source/database/hive/product_local_data_source_hive.dart'
    as _i81;
import 'package:soft_dream_test/data/repository/source/firebase/auth_datasource.dart'
    as _i704;
import 'package:soft_dream_test/data/repository/source/firebase/base/firebase_client.dart'
    as _i326;
import 'package:soft_dream_test/data/repository/source/firebase/cloud_store_data_source.dart'
    as _i675;
import 'package:soft_dream_test/data/repository/source/preference/app_preferences.dart'
    as _i517;
import 'package:soft_dream_test/data/repository/source/secure_storage/secure_store_local_data_source.dart'
    as _i682;
import 'package:soft_dream_test/data/repository/storage_repository_impl.dart'
    as _i126;
import 'package:soft_dream_test/data/repository/store_repository_impl.dart'
    as _i811;
import 'package:soft_dream_test/di/di.dart' as _i570;
import 'package:soft_dream_test/domain/navigation/app_navigator.dart' as _i1042;
import 'package:soft_dream_test/domain/repository/auth_repository.dart'
    as _i146;
import 'package:soft_dream_test/domain/repository/product_repository.dart'
    as _i898;
import 'package:soft_dream_test/domain/repository/storage_repository.dart'
    as _i301;
import 'package:soft_dream_test/domain/repository/store_repository.dart'
    as _i15;
import 'package:soft_dream_test/domain/usecase/auth/forgot_password_use_case.dart'
    as _i1071;
import 'package:soft_dream_test/domain/usecase/auth/login_use_case.dart'
    as _i68;
import 'package:soft_dream_test/domain/usecase/auth/logout_use_case.dart'
    as _i286;
import 'package:soft_dream_test/domain/usecase/auth/sign_up_use_case.dart'
    as _i515;
import 'package:soft_dream_test/domain/usecase/cloud/get_user_profile_use_case.dart'
    as _i105;
import 'package:soft_dream_test/domain/usecase/cloud/save_user_profile_use_case.dart'
    as _i166;
import 'package:soft_dream_test/domain/usecase/create_product_use_case.dart'
    as _i383;
import 'package:soft_dream_test/domain/usecase/delete_product_use_case.dart'
    as _i686;
import 'package:soft_dream_test/domain/usecase/get_all_product_use_case.dart'
    as _i601;
import 'package:soft_dream_test/domain/usecase/get_initial_app_data_use_case.dart'
    as _i811;
import 'package:soft_dream_test/domain/usecase/get_product_by_id_use_case.dart'
    as _i223;
import 'package:soft_dream_test/domain/usecase/load_initial_resource_use_case.dart'
    as _i982;
import 'package:soft_dream_test/domain/usecase/save_dark_mode_use_case.dart'
    as _i340;
import 'package:soft_dream_test/domain/usecase/save_language_app_use_case.dart'
    as _i669;
import 'package:soft_dream_test/domain/usecase/seed_if_empty_product_use_case.dart'
    as _i481;
import 'package:soft_dream_test/domain/usecase/update_product_use_case.dart'
    as _i362;
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart' as _i116;
import 'package:soft_dream_test/presentation/base/bloc/common/common_bloc.dart'
    as _i852;
import 'package:soft_dream_test/presentation/helper/local_push_notification_helper.dart'
    as _i605;
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
import 'package:soft_dream_test/presentation/ui/home/bloc/home_bloc.dart'
    as _i415;
import 'package:soft_dream_test/presentation/ui/main/bloc/main_bloc.dart'
    as _i614;
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_bloc.dart'
    as _i980;
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
    gh.factory<_i766.AccountInfoMapper>(() => const _i766.AccountInfoMapper());
    gh.factory<_i953.ProductMapper>(() => _i953.ProductMapper());
    gh.factory<_i556.LanguageCodeDataMapper>(
      () => _i556.LanguageCodeDataMapper(),
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => serviceModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i965.Box<_i622.ProductHiveModel>>(
      () => serviceModule.provideHiveDatabase(),
      preResolve: true,
    );
    gh.factory<_i852.CommonBloc>(() => _i852.CommonBloc());
    gh.factory<_i441.RouteGuard>(() => _i441.RouteGuard());
    gh.factory<_i614.MainBloc>(() => _i614.MainBloc());
    gh.lazySingleton<_i81.ProductLocalDataSourceHive>(
      () => _i81.ProductLocalDataSourceHive(),
    );
    gh.lazySingleton<_i326.FirebaseClient>(() => _i326.FirebaseClient());
    gh.lazySingleton<_i682.SecureStoreLocalDataSource>(
      () => const _i682.SecureStoreLocalDataSource(),
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => serviceModule.fireAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => serviceModule.fireStore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => serviceModule.google);
    gh.lazySingleton<_i605.LocalPushNotificationHelper>(
      () => _i605.LocalPushNotificationHelper(),
    );
    gh.lazySingleton<_i67.AppRouter>(() => _i67.AppRouter());
    gh.lazySingleton<_i906.AppInfo>(() => _i906.AppInfo());
    gh.lazySingleton<_i21.BaseRouteInfoMapper>(
      () => _i878.AppRouteInfoMapper(),
    );
    gh.lazySingleton<_i517.AppPreferences>(
      () => _i517.AppPreferences(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i675.CloudStoreDataSource>(
      () => _i675.CloudStoreDataSource(
        gh<_i974.FirebaseFirestore>(),
        gh<_i326.FirebaseClient>(),
      ),
    );
    gh.lazySingleton<_i301.StorageRepository>(
      () => _i126.StorageRepositoryImpl(
        gh<_i682.SecureStoreLocalDataSource>(),
        gh<_i517.AppPreferences>(),
        gh<_i556.LanguageCodeDataMapper>(),
      ),
    );
    gh.lazySingleton<_i1042.AppNavigator>(
      () => _i34.AppNavigatorImpl(
        gh<_i67.AppRouter>(),
        gh<_i21.BaseRouteInfoMapper>(),
      ),
    );
    gh.factory<_i982.LoadInitialResourceUseCase>(
      () => _i982.LoadInitialResourceUseCase(gh<_i301.StorageRepository>()),
    );
    gh.factory<_i340.SaveDarkModeUseCase>(
      () => _i340.SaveDarkModeUseCase(gh<_i301.StorageRepository>()),
    );
    gh.factory<_i669.SaveLanguageAppUseCase>(
      () => _i669.SaveLanguageAppUseCase(gh<_i301.StorageRepository>()),
    );
    gh.lazySingleton<_i704.AuthDatasource>(
      () => _i704.AuthDatasource(
        gh<_i59.FirebaseAuth>(),
        gh<_i326.FirebaseClient>(),
      ),
    );
    gh.lazySingleton<_i146.AuthRepository>(
      () => _i1052.AuthRepositoryImpl(gh<_i704.AuthDatasource>()),
    );
    gh.lazySingleton<_i898.ProductRepository>(
      () => _i993.ProductRepositoryImpl(
        gh<_i81.ProductLocalDataSourceHive>(),
        gh<_i953.ProductMapper>(),
      ),
    );
    gh.factory<_i68.LoginUseCase>(
      () => _i68.LoginUseCase(
        gh<_i146.AuthRepository>(),
        gh<_i301.StorageRepository>(),
      ),
    );
    gh.factory<_i4.LoginBloc>(() => _i4.LoginBloc(gh<_i68.LoginUseCase>()));
    gh.factory<_i383.CreateProductUseCase>(
      () => _i383.CreateProductUseCase(gh<_i898.ProductRepository>()),
    );
    gh.factory<_i686.DeleteProductUseCase>(
      () => _i686.DeleteProductUseCase(gh<_i898.ProductRepository>()),
    );
    gh.factory<_i601.GetAllProductUseCase>(
      () => _i601.GetAllProductUseCase(gh<_i898.ProductRepository>()),
    );
    gh.factory<_i223.GetProductByIdUseCase>(
      () => _i223.GetProductByIdUseCase(gh<_i898.ProductRepository>()),
    );
    gh.factory<_i481.SeedIfEmptyProductUseCase>(
      () => _i481.SeedIfEmptyProductUseCase(gh<_i898.ProductRepository>()),
    );
    gh.factory<_i362.UpdateProductUseCase>(
      () => _i362.UpdateProductUseCase(gh<_i898.ProductRepository>()),
    );
    gh.factory<_i811.GetInitialAppDataUseCase>(
      () => _i811.GetInitialAppDataUseCase(gh<_i301.StorageRepository>()),
    );
    gh.factory<_i515.SignUpUseCase>(
      () => _i515.SignUpUseCase(gh<_i146.AuthRepository>()),
    );
    gh.factory<_i415.HomeBloc>(
      () => _i415.HomeBloc(
        gh<_i481.SeedIfEmptyProductUseCase>(),
        gh<_i601.GetAllProductUseCase>(),
        gh<_i383.CreateProductUseCase>(),
      ),
    );
    gh.factory<_i980.DetailProductBloc>(
      () => _i980.DetailProductBloc(
        gh<_i686.DeleteProductUseCase>(),
        gh<_i362.UpdateProductUseCase>(),
        gh<_i223.GetProductByIdUseCase>(),
      ),
    );
    gh.lazySingleton<_i116.AppBloc>(
      () => _i116.AppBloc(
        gh<_i811.GetInitialAppDataUseCase>(),
        gh<_i340.SaveDarkModeUseCase>(),
        gh<_i669.SaveLanguageAppUseCase>(),
      ),
    );
    gh.lazySingleton<_i15.StoreRepository>(
      () => _i811.StoreRepositoryImpl(
        gh<_i517.AppPreferences>(),
        gh<_i704.AuthDatasource>(),
        gh<_i766.AccountInfoMapper>(),
        gh<_i675.CloudStoreDataSource>(),
      ),
    );
    gh.factory<_i105.GetUserProfileUseCase>(
      () => _i105.GetUserProfileUseCase(
        gh<_i15.StoreRepository>(),
        gh<_i301.StorageRepository>(),
      ),
    );
    gh.factory<_i1071.ForgotPasswordUseCase>(
      () => _i1071.ForgotPasswordUseCase(gh<_i146.AuthRepository>()),
    );
    gh.factory<_i286.LogoutUseCase>(
      () => _i286.LogoutUseCase(
        gh<_i301.StorageRepository>(),
        gh<_i1042.AppNavigator>(),
        gh<_i146.AuthRepository>(),
      ),
    );
    gh.factory<_i166.SaveUserProfileUseCase>(
      () => _i166.SaveUserProfileUseCase(gh<_i15.StoreRepository>()),
    );
    gh.factory<_i673.SignUpBloc>(
      () => _i673.SignUpBloc(
        gh<_i515.SignUpUseCase>(),
        gh<_i166.SaveUserProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i768.AccountInfoBloc>(
      () => _i768.AccountInfoBloc(
        gh<_i105.GetUserProfileUseCase>(),
        gh<_i286.LogoutUseCase>(),
      ),
    );
    gh.factory<_i443.ForgotPasswordBloc>(
      () => _i443.ForgotPasswordBloc(gh<_i1071.ForgotPasswordUseCase>()),
    );
    return this;
  }
}

class _$ServiceModule extends _i570.ServiceModule {}
