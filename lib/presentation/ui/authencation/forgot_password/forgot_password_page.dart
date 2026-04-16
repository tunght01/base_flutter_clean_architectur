import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/app_bar/base_app_bar.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/bloc/forgot_password_event.dart';
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/widget/forgot_password_form.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPageState();
  }
}

class _ForgotPasswordPageState
    extends BasePageState<ForgotPasswordPage, ForgotPasswordBloc> {
  void _onSendPress() {
    FocusManager.instance.primaryFocus?.unfocus();
    bloc.add(const OnPressSendEvent());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        label: S.current.forgot_password_title,
      ),
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
                  child: ForgotPasswordForm(
                    onSendPress: () => _onSendPress.call(),
                    onEmailChanged: (email) =>
                        bloc.add(OnChangeEmailEvent(email: email)),
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
