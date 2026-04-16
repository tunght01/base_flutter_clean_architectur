import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:soft_dream_test/domain/usecase/load_initial_resource_use_case.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_event.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_state.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/navigation/observer/app_navigator_observer.dart';
import 'package:soft_dream_test/presentation/navigation/routes/app_router.dart';
import 'package:soft_dream_test/presentation/resource/dimens/app_dimen.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_themes.dart';
import 'package:soft_dream_test/presentation/utils/app_connection_utils.dart';
import 'package:soft_dream_test/shared/constants/device_constants.dart';
import 'package:soft_dream_test/shared/constants/locale_constants.dart';
import 'package:soft_dream_test/shared/constants/ui_constants.dart';

import '../navigation/routes/app_router.gr.dart';

class MyApp extends StatefulWidget {
  const MyApp({required this.initialResource, super.key});

  final LoadInitialResourceOutput initialResource;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BasePageState<MyApp, AppBloc> {
  final _appRouter = GetIt.instance.get<AppRouter>();
  late final AppConnectionUtils connectionUtils;
  bool firstNetworkChange = true;

  @override
  bool get isAppWidget => true;

  @override
  void initState() {
    super.initState();
    bloc.add(const AppInitiated());
    detectNetworkChanged();
  }

  @override
  void didChangeDependencies() {
    AppDimen.of(context);
    AppColors.of(context);
    super.didChangeDependencies();
  }

  @override
  void onPauseApp() {}

  @override
  void onResumeApp() {}

  Future<void> detectNetworkChanged() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    bloc.add(UpdateConnectivityType(connectivityResult));
    connectionUtils = AppConnectionUtils.instance((connection) {
      bloc.add(UpdateConnectivityType(connection.type));
    });
  }

  @override
  void dispose() {
    connectionUtils.dispose();
    bloc.add(const DisconnectSocket());
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        DeviceConstants.designDeviceWidth,
        DeviceConstants.designDeviceHeight,
      ),
      builder: (context, _) => MultiBlocListener(
        listeners: [
          BlocListener<AppBloc, AppState>(
            listenWhen: (previous, current) =>
                previous.connectivityType != current.connectivityType,
            listener: (context, state) {
              if (firstNetworkChange) {
                firstNetworkChange = false;
              } else if (state.connectivityType.contains(
                ConnectivityResult.none,
              )) {
                bloc.add(const DisconnectSocket());
              } else {
                bloc.add(const ConnectSocket());
              }
            },
          ),
          BlocListener<AppBloc, AppState>(
            listenWhen: (previous, current) =>
                previous.appInitiated != current.appInitiated,
            listener: (context, state) {
              if (state.appInitiated) {
                // FlutterNativeSplash.remove();
              }
            },
          ),
          BlocListener<AppBloc, AppState>(
            listenWhen: (previous, current) =>
                previous.isLoggedIn != current.isLoggedIn,
            listener: (context, state) {
              if (state.isLoggedIn) {
              } else {}
            },
          ),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          buildWhen: (previous, current) =>
              previous.isDarkTheme != current.isDarkTheme ||
              previous.languageCode != current.languageCode,
          builder: (context, state) {
            AppThemeSetting.currentAppThemeType = state.isDarkTheme
                ? AppThemeType.dark
                : AppThemeType.light;
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.black,
                // navigation bar color, the one Im looking for
                statusBarColor: Colors.transparent,
              ),
              child: OverlaySupport.global(
                child: MaterialApp.router(
                  builder: (context, child) {
                    final MediaQueryData data = MediaQuery.of(context);
                    return MediaQuery(
                      data: data.copyWith(
                        textScaler: const TextScaler.linear(1.0),
                      ),
                      child: child ?? const SizedBox.shrink(),
                    );
                  },
                  routerDelegate: _appRouter.delegate(
                    deepLinkBuilder: (deepLink) {
                      return DeepLink(_mapRouteToPageRouteInfo());
                    },
                    navigatorObservers: () => [AppNavigatorObserver()],
                  ),
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  title: UiConstants.materialAppTitle,
                  color: UiConstants.taskMenuMaterialAppColor,
                  themeMode: state.isDarkTheme
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  debugShowCheckedModeBanner: false,
                  localeResolutionCallback:
                      (Locale? locale, Iterable<Locale> supportedLocales) =>
                          supportedLocales.contains(locale)
                          ? locale
                          : const Locale(LocaleConstants.defaultLocale),
                  locale: Locale(state.languageCode.localeCode),
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<PageRouteInfo> _mapRouteToPageRouteInfo() {
    return [const LoginRoute()];
  }
}
