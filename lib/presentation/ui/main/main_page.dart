import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/navigator/bottom_navigation_bar_widget.dart';
import 'package:soft_dream_test/presentation/navigation/app_navigator_impl.dart';
import 'bloc/main.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends BasePageState<MainPage, MainBloc> {
  final _bottomBarKey = GlobalKey();

  @override
  Widget buildPageListeners({required Widget child}) {
    return BlocListener<MainBloc, MainState>(
      listenWhen: (previous, current) {
        return previous.tabIndex != current.tabIndex;
      },
      listener: (_, state) {},
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (cur, pre) => cur.tabIndex != pre.tabIndex,
      builder: (context, state) {
        return AutoTabsScaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          animationDuration: Duration.zero,
          routes: (navigator as AppNavigatorImpl).tabRoutes,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBuilder: (_, tabsRouter) {
            (navigator as AppNavigatorImpl).tabsRouter = tabsRouter;
            return BottomNavBarWidget(
              key: _bottomBarKey,
              pageIndex: state.tabIndex,
              onChanged: (index) async {
                tabsRouter.setActiveIndex(index);
                bloc.add(ChangeTabIndexEvent(index: index));
              },
            );
          },
        );
      },
    );
  }
}
