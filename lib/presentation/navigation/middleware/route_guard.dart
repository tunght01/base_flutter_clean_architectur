import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/navigation/routes/app_router.gr.dart';
import '../../../di/di.dart';

@Injectable()
class RouteGuard extends AutoRouteGuard {
  RouteGuard();

  bool get _isLoggedIn => getIt.get<AppBloc>().state.isLoggedIn;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (_isLoggedIn) {
      resolver.next(true);
    } else {
      await router.push(const LoginRoute());
      if (getIt.get<AppBloc>().state.isLoggedIn) {
        resolver.next(true);
      } else {
        resolver.next(false);
      }
    }
  }
}
