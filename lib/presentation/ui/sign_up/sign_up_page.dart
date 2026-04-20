import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/app_bar/base_app_bar.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_bloc.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_event.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/widget/sign_up_form.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage, SignUpBloc> {
  void _onSignUp() {
    FocusManager.instance.primaryFocus?.unfocus();
    bloc.add(const OnPressSignUpEvent());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: BaseAppBar(centerTitle: true, label: S.current.sign_up_title),
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
                  child: SignUpForm(
                    onSignUpPress: () => _onSignUp.call(),
                    onCheckbox: (value) {
                      bloc.add(OnChangeAgreePoicyEvent(value: value));
                    },
                    onUsernameChanged: (username) =>
                        bloc.add(OnChangeSignUpEmailEvent(email: username)),
                    onPasswordChanged: (password) => bloc.add(
                      OnChangeSignUpPasswordEvent(password: password),
                    ),
                    onConfirmPasswordChanged: (confirmPassword) => bloc.add(
                      OnChangeSignUpConfirmPasswordEvent(
                        confirmPassword: confirmPassword,
                      ),
                    ),
                    onFullNameChanged: (String? value) =>
                        bloc.add(OnFullNameChangedEvent(value: value)),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).already_account,
                        style: AppTextStyle.bold10(
                          color: AppColors.of(context).textSubTitle,
                        ),
                      ),
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            getIt<AppNavigator>().pop();
                          },
                          child: Text(
                            S.of(context).login_button,
                            style: AppTextStyle.bold10(
                              color: AppColors.of(context).primaryDefault,
                            ),
                          ),
                        ),
                      ),
                    ],
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
