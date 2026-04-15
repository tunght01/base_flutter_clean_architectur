import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/common_view/text_field/app_text_form_field.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_bloc.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_event.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final FocusNode _usernameFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _onLogin() {
    FocusManager.instance.primaryFocus?.unfocus();
    bloc.add(OnPressEvent());
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Đăng nhập', style: AppTextStyle.semiBold24(color: AppColors.current.textTitle)),
      ),
      backgroundColor: AppColors.current.mobileBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.d24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Logo
                Assets.images.imgLogo.image(width: Dimens.d120),
                kSpacingHeight40,

                /// Username field
                AppTextFormField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  labelText: 'Tài khoản',
                  hintText: 'Nhập tài khoản',
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    bloc.add(OnChangeEmailEvent(email: value));
                  },
                  onSubmitted: (_) {
                    _passwordFocusNode.requestFocus();
                  },
                ),
                kSpacingHeight16,

                /// Password field
                AppTextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  labelText: 'Mật khẩu',
                  hintText: 'Nhập mật khẩu',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    bloc.add(OnChangePasswordEvent(password: value));
                  },
                  onSubmitted: (_) {
                    _onLogin();
                  },
                ),
                kSpacingHeight32,

                /// Login button
                SizedBox(
                  width: double.infinity,
                  height: Dimens.d48,
                  child: ElevatedButton(
                    onPressed: _onLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.current.buttonPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.d12)),
                    ),
                    child: Text('Đăng nhập', style: AppTextStyle.semiBold16(color: AppColors.current.textOnColor)),
                  ),
                ),
                kSpacingHeight16,

                /// Register button
                SizedBox(
                  width: double.infinity,
                  height: Dimens.d48,
                  child: OutlinedButton(
                    onPressed: () {
                      _onLogin();
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.current.buttonPrimary),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.d12)),
                    ),
                    child: Text('Đăng ký', style: AppTextStyle.semiBold16(color: AppColors.current.buttonPrimary)),
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
