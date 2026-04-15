import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  Widget buildPage(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      routes: (navigator as AppNavigatorImpl).tabRoutes,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBuilder: (_, tabsRouter) {
        (navigator as AppNavigatorImpl).tabsRouter = tabsRouter;
        return BottomNavBarWidget(
          key: _bottomBarKey,
          pageIndex: tabsRouter.activeIndex,
          onChanged: (index) async {
            if (index == tabsRouter.activeIndex) {
              (navigator as AppNavigatorImpl).popUntilRootOfCurrentBottomTab();
            }
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }
}
