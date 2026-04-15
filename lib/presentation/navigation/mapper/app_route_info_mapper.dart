import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/presentation/navigation/base/base_route_info_mapper.dart';
import 'package:soft_dream_test/presentation/navigation/routes/app_router.gr.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      openAccount: () => const SignUpRoute(),
      forgotPassword: () => const ForgotPasswordRoute(),
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
    );
  }
}
