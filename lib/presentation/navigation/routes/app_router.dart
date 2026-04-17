import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/presentation/navigation/routes/app_router.gr.dart';

// ignore_for_file:prefer-single-widget-per-file
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@LazySingleton()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    // AutoRoute(page: MarketRoute.page),
    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(
          page: HomeTab.page,
          children: [AutoRoute(page: HomeRoute.page, initial: true)],
        ),
        AutoRoute(
          page: ProfileTab.page,
          children: [AutoRoute(page: ProfileRoute.page, initial: true)],
        ),
        AutoRoute(
          page: NotificationTab.page,
          children: [AutoRoute(page: NotificationRoute.page, initial: true)],
        ),
      ],
    ),
  ];
}

@RoutePage(name: 'HomeTab')
class HomeTabPage extends AutoRouter {
  const HomeTabPage({super.key});
}

@RoutePage(name: 'ProfileTab')
class ProfileTabPage extends AutoRouter {
  const ProfileTabPage({super.key});
}

@RoutePage(name: 'NotificationTab')
class NotificationTabPage extends AutoRouter {
  const NotificationTabPage({super.key});
}
