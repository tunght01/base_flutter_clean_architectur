import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/presentation/common_view/button/app_button.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/common_view/text_field/app_text_form_field.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_bloc.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_event.dart';
import 'package:soft_dream_test/presentation/ui/authencation/login/bloc/login_state.dart';
import 'package:soft_dream_test/presentation/utils/validator_utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.onLoginPress,
    required this.onUsernameChanged,
    required this.onPasswordChanged,
    required this.openAccountPress,
    super.key,
  });

  final VoidCallback onLoginPress;
  final VoidCallback openAccountPress;
  final void Function(String?) onUsernameChanged;
  final void Function(String?) onPasswordChanged;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with ValidatorUtils, AutomaticKeepAliveClientMixin {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final FocusNode _usernameFocusNode;
  late final FocusNode _passwordFocusNode;
  late final GlobalKey<FormState> loginFormKey;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    loginFormKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.d28),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.20),
                Color.fromRGBO(0, 0, 0, 0.13),
              ],
              stops: [0.4142, 1.0],
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.d40,
            horizontal: Dimens.d16,
          ),
          child: Form(
            key: loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<LoginBloc, LoginState>(
                  listenWhen: (previous, current) {
                    return previous.initialUsername != current.initialUsername;
                  },
                  listener: (BuildContext context, LoginState state) {
                    _usernameController.text = state.initialUsername!;
                  },
                  buildWhen: (previous, current) {
                    return previous.loginError != current.loginError ||
                        previous.isFirstPress != current.isFirstPress ||
                        previous.email != current.email;
                  },
                  builder: (_, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Xin chào',
                          style: AppTextStyle.medium24(
                            color: AppColors.current.primaryDefault,
                          ),
                        ),
                        kSpacingHeight24,
                        AppTextFormField(
                          controller: _usernameController,
                          focusNode: _usernameFocusNode,
                          required: true,
                          isClear: true,
                          validator: (value) {
                            return emailValidator(_usernameController.text);
                          },
                          fillColor: AppColors.current.neutralBlack1100
                              .withValues(alpha: 0.15),
                          isError: state.loginError != null,
                          title: S.current.login_email_label,
                          titleColor: AppColors.current.textSubTitle,
                          autoValidate: state.isFirstPress,
                          onChanged: widget.onUsernameChanged,
                          textInputAction: TextInputAction.next,
                          onSubmitted: (_) {
                            _passwordFocusNode.requestFocus();
                          },
                        ),
                      ],
                    );
                  },
                ),
                kSpacingHeight16,
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) {
                    return previous.loginError != current.loginError ||
                        previous.isFirstPress != current.isFirstPress ||
                        previous.password != current.password;
                  },
                  builder: (context, state) {
                    return AppTextFormField(
                      maxLength: 50,
                      required: true,
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      validator: passwordValidator,
                      isPassword: true,
                      titleColor: AppColors.current.textSubTitle,
                      fillColor: AppColors.current.neutralBlack1100.withValues(
                        alpha: 0.15,
                      ),
                      onSubmitted: (_) {
                        context.read<LoginBloc>().add(
                          const OnChangeFirstSubmitEvent(),
                        );

                        if (loginFormKey.currentState?.validate() ?? false) {
                          if (state.email != null) {}
                          widget.onLoginPress.call();
                        }
                      },
                      autoValidate: state.isFirstPress,
                      title: S.current.login_password_label,
                      isError: state.loginError != null,
                      errorText: state.loginError,
                      textInputAction: TextInputAction.done,
                      onChanged: widget.onPasswordChanged,
                    );
                  },
                ),
                kSpacingHeight8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) {
                        return previous.loginError != current.loginError ||
                            previous.email != current.email;
                      },
                      builder: (_, state) {
                        return GestureDetector(
                          onTap: () async {
                            widget.openAccountPress.call();
                          },
                          child: Text(
                            S.current.login_create_account,
                            style: AppTextStyle.medium14(
                              color: AppColors.current.primaryDefault,
                            ),
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        GetIt.I.get<AppNavigator>().push(
                          const AppRouteInfo.forgotPassword(),
                        );
                      },
                      child: Text(
                        S.current.login_forgot_password,
                        style: AppTextStyle.medium14(
                          color: AppColors.current.primaryDefault,
                        ),
                      ),
                    ),
                  ],
                ),
                kSpacingHeight32,
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.showLoginButtonLoading !=
                          current.showLoginButtonLoading ||
                      previous.email != current.email,
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            isLoading: state.showLoginButtonLoading,
                            label: S.current.login_button,
                            labelTextStyle: AppTextStyle.bold16(
                              color: Colors.white,
                            ),
                            backgroundColor: AppColors.current.primaryDefault,
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                const OnChangeFirstSubmitEvent(),
                              );

                              if (loginFormKey.currentState?.validate() ??
                                  false) {
                                if (state.email != null) {}
                                widget.onLoginPress.call();
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
