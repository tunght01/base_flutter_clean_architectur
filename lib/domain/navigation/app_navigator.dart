import 'package:flutter/material.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';

abstract class AppNavigator {
  const AppNavigator();

  bool get canPopSelfOrChildren;

  int get currentBottomTab;


  String getCurrentRouteName({bool useRootNavigator = false});

  void popUntilRootOfCurrentBottomTab();

  void navigateToBottomTab(int index, {bool notify = true});

  Future<T?> push<T extends Object?>(AppRouteInfo appRouteInfo);
  // Future<T?> pushRoute<T extends Object?>(dynamic route);
  // Future<void> navigateRoute(dynamic route);

  Future<void> pushAll(List<AppRouteInfo> listAppRouteInfo);

  Future<T?> replace<T extends Object?>(AppRouteInfo appRouteInfo);

  Future<void> replaceAll(List<AppRouteInfo> listAppRouteInfo);

  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  });

  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    AppRouteInfo appRouteInfo, {
    R? result,
    bool useRootNavigator = false,
  });

  Future<void> popAndPushAll(
    List<AppRouteInfo> listAppRouteInfo, {
    bool useRootNavigator = false,
  });

  void popUntilRoot({bool useRootNavigator = false});

  void popUntilRouteName(String routeName);

  bool removeUntilRouteName(String routeName);

  bool removeAllRoutesWithName(String routeName);

  bool removeLast();

  Future<T?> showAlertDialog<T extends Object?>(
    Widget child, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  });

  Future<bool> handleRequiredLogin<T extends Object?>();

  void showErrorSnackBar(String message, {Duration? duration});

  void showSuccessSnackBar(String message, {Duration? duration, String? title});

  void showWarningSnackBar(
    String message, {
    Duration? duration,
    String? title,
    TextStyle? messageStyle,
    TextStyle? titleStyle,
  });
}
