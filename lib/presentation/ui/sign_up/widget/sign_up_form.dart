import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/presentation/common_view/button/app_button.dart';
import 'package:soft_dream_test/presentation/common_view/check_box/checkbox_widget.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/common_view/text_field/app_text_form_field.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_bloc.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_event.dart';
import 'package:soft_dream_test/presentation/ui/sign_up/bloc/sign_up_state.dart';
import 'package:soft_dream_test/presentation/utils/validator_utils.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.onSignUpPress,
    required this.onFullNameChanged,
    required this.onUsernameChanged,
    required this.onPasswordChanged,
    required this.onConfirmPasswordChanged,
    required this.onCheckbox,
    super.key,
  });

  final VoidCallback onSignUpPress;
  final void Function(String?) onFullNameChanged;
  final void Function(String?) onUsernameChanged;
  final void Function(String?) onPasswordChanged;
  final void Function(String?) onConfirmPasswordChanged;
  final void Function(bool) onCheckbox;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>
    with ValidatorUtils, AutomaticKeepAliveClientMixin {
  late final TextEditingController _fullNameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final FocusNode _fullNameFocusNode;
  late final FocusNode _usernameFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;
  late final GlobalKey<FormState> signUpFormKey;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fullNameFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    signUpFormKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _fullNameFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
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
            key: signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) {
                    return previous.signUpError != current.signUpError ||
                        previous.isFirstPress != current.isFirstPress ||
                        previous.email != current.email;
                  },
                  builder: (_, state) {
                    return AppTextFormField(
                      controller: _fullNameController,
                      focusNode: _fullNameFocusNode,
                      required: true,
                      fillColor: AppColors.current.neutralBlack1100
                          .withValues(alpha: 0.15),
                      title: S.current.full_name,
                      titleColor: AppColors.current.textSubTitle,
                      autoValidate: state.isFirstPress,
                      validator: emptyValidator,
                      onChanged: widget.onFullNameChanged,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        _usernameFocusNode.requestFocus();
                      },
                    );
                  },
                ),
                kSpacingHeight16,
                BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) {
                    return previous.signUpError != current.signUpError ||
                        previous.isFirstPress != current.isFirstPress ||
                        previous.email != current.email;
                  },
                  builder: (_, state) {
                    return AppTextFormField(
                      controller: _usernameController,
                      focusNode: _usernameFocusNode,
                      required: true,
                      validator: (value) {
                        return emailValidator(_usernameController.text);
                      },
                      fillColor: AppColors.current.neutralBlack1100
                          .withValues(alpha: 0.15),
                      isError: state.signUpError != null,
                      title: S.current.login_email_label,
                      titleColor: AppColors.current.textSubTitle,
                      autoValidate: state.isFirstPress,
                      onChanged: widget.onUsernameChanged,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        _passwordFocusNode.requestFocus();
                      },
                    );
                  },
                ),
                kSpacingHeight16,
                BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) {
                    return previous.signUpError != current.signUpError ||
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
                        _confirmPasswordFocusNode.requestFocus();
                      },
                      autoValidate: state.isFirstPress,
                      title: S.current.login_password_label,
                      isError: state.signUpError != null,
                      textInputAction: TextInputAction.next,
                      onChanged: widget.onPasswordChanged,
                    );
                  },
                ),
                kSpacingHeight16,
                BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) {
                    return previous.signUpError != current.signUpError ||
                        previous.isFirstPress != current.isFirstPress ||
                        previous.confirmPassword != current.confirmPassword;
                  },
                  builder: (context, state) {
                    return AppTextFormField(
                      maxLength: 50,
                      required: true,
                      controller: _confirmPasswordController,
                      focusNode: _confirmPasswordFocusNode,
                      validator: (value) {
                        return samePasswordValidator(
                          _passwordController.text,
                          value,
                        );
                      },
                      isPassword: true,
                      titleColor: AppColors.current.textSubTitle,
                      fillColor: AppColors.current.neutralBlack1100.withValues(
                        alpha: 0.15,
                      ),

                      onSubmitted: (_) {
                        context.read<SignUpBloc>().add(
                          const OnChangeSignUpFirstSubmitEvent(),
                        );

                        if (signUpFormKey.currentState?.validate() ?? false) {
                          widget.onSignUpPress.call();
                        }
                      },
                      autoValidate: state.isFirstPress,
                      title: S.current.sign_up_password_confirm_label,
                      isError: state.signUpError != null,
                      errorText: state.signUpError,
                      textInputAction: TextInputAction.done,
                      onChanged: widget.onConfirmPasswordChanged,
                    );
                  },
                ),

                kSpacingHeight32,
                CheckboxWidget(
                  contentStyle: AppTextStyle.medium10(),
                  content: S.current.i_agree_policy,
                  onChanged: (bool value) {
                    widget.onCheckbox.call(value);
                  },
                ),
                kSpacingHeight10,
                AppButton(
                  label: S.current.sign_up_button,
                  labelTextStyle: AppTextStyle.bold16(color: Colors.white),
                  backgroundColor: AppColors.current.primaryDefault,
                  onPressed: () {
                    context.read<SignUpBloc>().add(
                      const OnChangeSignUpFirstSubmitEvent(),
                    );

                    if (signUpFormKey.currentState?.validate() ?? false) {
                      widget.onSignUpPress.call();
                    }
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
