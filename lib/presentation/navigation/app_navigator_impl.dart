import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/config/log_config.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/navigation/base/base_route_info_mapper.dart';
import 'package:soft_dream_test/presentation/navigation/routes/app_router.dart';
import 'package:soft_dream_test/presentation/navigation/routes/app_router.gr.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/shared/mixin/log_mixin.dart';
import '../../di/di.dart';

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl extends AppNavigator with LogMixin {
  AppNavigatorImpl(this._appRouter, this._appRouteInfoMapper);

  final tabRoutes = const [HomeTab(), ProfileTab(), NotificationTab()];

  TabsRouter? tabsRouter;

  final AppRouter _appRouter;
  final BaseRouteInfoMapper _appRouteInfoMapper;

  StackRouter? get _currentTabRouter {
    return tabsRouter?.stackRouterOfIndex(currentBottomTab);
  }

  StackRouter get _currentTabRouterOrRootRouter =>
      _currentTabRouter ?? _appRouter;

  m.BuildContext get _rootRouterContext =>
      _appRouter.navigatorKey.currentContext!;

  m.BuildContext? get _currentTabRouterContext =>
      _currentTabRouter?.navigatorKey.currentContext;

  m.BuildContext get _currentTabContextOrRootContext =>
      _currentTabRouterContext ?? _rootRouterContext;

  @override
  int get currentBottomTab {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    return tabsRouter?.activeIndex ?? 0;
  }

  @override
  bool get canPopSelfOrChildren => _appRouter.canPop();

  @override
  String getCurrentRouteName({bool useRootNavigator = true}) => AutoRouter.of(
    useRootNavigator ? _rootRouterContext : _currentTabContextOrRootContext,
  ).current.name;

  @override
  void popUntilRootOfCurrentBottomTab() {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    if (_currentTabRouter?.canPop() == true) {
      if (LogConfig.enableNavigatorObserverLog) {
        logD('popUntilRootOfCurrentBottomTab');
      }
      _currentTabRouter?.popUntilRoot();
    }
  }

  @override
  void navigateToBottomTab(int index, {bool notify = true}) {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    if (LogConfig.enableNavigatorObserverLog) {
      logD('navigateToBottomTab with index = $index, notify = $notify');
    }
    tabsRouter?.setActiveIndex(index, notify: notify);
  }

  @override
  Future<T?> push<T extends Object?>(AppRouteInfo appRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('push $appRouteInfo');
    }

    return _appRouter.push<T>(_appRouteInfoMapper.map(appRouteInfo));
  }

  @override
  Future<void> pushAll(List<AppRouteInfo> listAppRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pushAll $listAppRouteInfo');
    }

    return _appRouter.pushAll(_appRouteInfoMapper.mapList(listAppRouteInfo));
  }

  @override
  Future<T?> replace<T extends Object?>(AppRouteInfo appRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replace by $appRouteInfo');
    }

    return _appRouter.replace<T>(_appRouteInfoMapper.map(appRouteInfo));
  }

  @override
  Future<void> replaceAll(List<AppRouteInfo> listAppRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replaceAll by $listAppRouteInfo');
    }

    return _appRouter.replaceAll(_appRouteInfoMapper.mapList(listAppRouteInfo));
  }

  @override
  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = true,
  }) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pop with result = $result, useRootNav = $useRootNavigator');
    }
    return useRootNavigator
        ? _appRouter.maybePop<T>(result)
        : _currentTabRouterOrRootRouter.maybePop<T>(result);
  }

  @override
  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    AppRouteInfo appRouteInfo, {
    R? result,
    bool useRootNavigator = true,
  }) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD(
        'popAndPush $appRouteInfo with result = $result, useRootNav = $useRootNavigator',
      );
    }

    return useRootNavigator
        ? _appRouter.popAndPush<T, R>(
            _appRouteInfoMapper.map(appRouteInfo),
            result: result,
          )
        : _currentTabRouterOrRootRouter.popAndPush<T, R>(
            _appRouteInfoMapper.map(appRouteInfo),
            result: result,
          );
  }

  @override
  void popUntilRoot({bool useRootNavigator = true}) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popUntilRoot, useRootNav = $useRootNavigator');
    }

    useRootNavigator
        ? _appRouter.popUntilRoot()
        : _currentTabRouterOrRootRouter.popUntilRoot();
  }

  @override
  void popUntilRouteName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popUntilRouteName $routeName');
    }

    _appRouter.popUntilRouteWithName(routeName);
  }

  @override
  bool removeUntilRouteName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeUntilRouteName $routeName');
    }

    return _appRouter.removeUntil((route) => route.name == routeName);
  }

  @override
  bool removeAllRoutesWithName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeAllRoutesWithName $routeName');
    }

    return _appRouter.removeWhere((route) => route.name == routeName);
  }

  @override
  Future<void> popAndPushAll(
    List<AppRouteInfo> listAppRouteInfo, {
    bool useRootNavigator = true,
  }) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popAndPushAll $listAppRouteInfo, useRootNav = $useRootNavigator');
    }

    return useRootNavigator
        ? _appRouter.popAndPushAll(
            _appRouteInfoMapper.mapList(listAppRouteInfo),
          )
        : _currentTabRouterOrRootRouter.popAndPushAll(
            _appRouteInfoMapper.mapList(listAppRouteInfo),
          );
  }

  @override
  bool removeLast() {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeLast');
    }

    return _appRouter.removeLast();
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {
    m.ScaffoldMessenger.of(_rootRouterContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        m.SnackBar(
          content: m.Text(
            message,
            style: AppTextStyle.medium12(color: AppColors.current.textBody),
          ),
          backgroundColor: AppColors.current.errorDefault,
          behavior: m.SnackBarBehavior.floating,
          duration: duration ?? const Duration(seconds: 3),
        ),
      );
  }

  @override
  void showWarningSnackBar(
    String message, {
    Duration? duration,
    String? title,
    TextStyle? messageStyle,
    TextStyle? titleStyle,
  }) {
    m.ScaffoldMessenger.of(_rootRouterContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        m.SnackBar(
          content: m.Text(
            message,
            style: AppTextStyle.medium12(color: AppColors.current.textBody),
          ),
          backgroundColor: AppColors.current.yellow500,
          behavior: m.SnackBarBehavior.floating,
          duration: duration ?? const Duration(seconds: 3),
        ),
      );
  }

  @override
  void showSuccessSnackBar(
    String message, {
    Duration? duration,
    String? title,
  }) {
    m.ScaffoldMessenger.of(_rootRouterContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        m.SnackBar(
          content: m.Text(
            message,
            style: AppTextStyle.medium12(color: AppColors.current.textBody),
          ),
          backgroundColor: AppColors.current.successDefault,
          behavior: m.SnackBarBehavior.floating,
          duration: duration ?? const Duration(seconds: 3),
        ),
      );
  }

  @override
  Future<T?> showAlertDialog<T extends Object?>(
    m.Widget child, {
    bool barrierDismissible = false,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  }) {
    return m.showAdaptiveDialog<T>(
      context: useRootNavigator
          ? _rootRouterContext
          : _currentTabContextOrRootContext,
      builder: (_) => m.PopScope(canPop: barrierDismissible, child: child),
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
    );
  }

  @override
  Future<bool> handleRequiredLogin<T extends Object?>() async {
    if (getIt.get<AppBloc>().state.isLoggedIn) {
      return true;
    }
    await push(const AppRouteInfo.login());
    if (!getIt.get<AppBloc>().state.isLoggedIn) {
      unawaited(replace(const AppRouteInfo.main()));
    }
    return getIt.get<AppBloc>().state.isLoggedIn;
  }

  // @override
  // Future<T?> pushRoute<T extends Object?>(dynamic route) {
  //   return _appRouter.push<T>(route);
  // }
  //
  // @override
  // Future<void> navigateRoute(route) {
  //   return _appRouter.navigate(route);
  // }
}
