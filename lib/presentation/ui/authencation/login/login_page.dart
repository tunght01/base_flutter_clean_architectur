import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/app_bar/base_app_bar.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_bloc.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_event.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/widget/login_form.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {
  void _onLogin() {
    FocusManager.instance.primaryFocus?.unfocus();
    bloc.add(const OnPressEvent());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: BaseAppBar(centerTitle: true, label: S.current.login_button),
      backgroundColor: AppColors.current.mobileBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.d24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.imgLogo.image(width: Dimens.d120),
                kSpacingHeight40,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimens.d16),
                  child: LoginForm(
                    onLoginPress: () => _onLogin.call(),
                    onUsernameChanged: (username) =>
                        bloc.add(OnChangeEmailEvent(email: username)),
                    onPasswordChanged: (password) =>
                        bloc.add(OnChangePasswordEvent(password: password)),
                    openAccountPress: () async {
                      getIt<AppNavigator>().push(AppRouteInfo.openAccount());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
