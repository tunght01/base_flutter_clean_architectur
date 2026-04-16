import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/presentation/common_view/button/app_button.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/common_view/text_field/app_text_form_field.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/bloc/forgot_password_event.dart';
import 'package:soft_dream_test/presentation/ui/authencation/forgot_password/bloc/forgot_password_state.dart';
import 'package:soft_dream_test/presentation/utils/validator_utils.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    required this.onSendPress,
    required this.onEmailChanged,
    super.key,
  });

  final VoidCallback onSendPress;
  final void Function(String?) onEmailChanged;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm>
    with ValidatorUtils {
  late final TextEditingController _emailController;
  late final FocusNode _emailFocusNode;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _emailFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.forgot_password_title,
                  style: AppTextStyle.medium24(
                    color: AppColors.current.primaryDefault,
                  ),
                ),
                kSpacingHeight12,
                Text(
                  S.current.forgot_password_instruction,
                  style: AppTextStyle.regular14(
                    color: AppColors.current.textSubTitle,
                  ),
                ),
                kSpacingHeight24,
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  buildWhen: (previous, current) {
                    return previous.error != current.error ||
                        previous.isFirstPress != current.isFirstPress ||
                        previous.email != current.email;
                  },
                  builder: (_, state) {
                    return AppTextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      required: true,
                      validator: (value) =>
                          emailValidator(_emailController.text),
                      fillColor: AppColors.current.neutralBlack1100.withValues(
                        alpha: 0.15,
                      ),
                      isError: state.error != null,
                      errorText: state.error,
                      title: S.current.login_email_label,
                      titleColor: AppColors.current.textSubTitle,
                      autoValidate: state.isFirstPress,
                      onChanged: widget.onEmailChanged,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) {
                        context.read<ForgotPasswordBloc>().add(
                          const OnFirstSubmitEvent(),
                        );
                        if (_formKey.currentState?.validate() ?? false) {
                          widget.onSendPress.call();
                        }
                      },
                    );
                  },
                ),
                kSpacingHeight8,
                Text(
                  S.current.forgot_password_social_note,
                  style: AppTextStyle.regular12(
                    color: AppColors.current.textSubTitle,
                  ),
                ),
                kSpacingHeight32,
                BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                  listenWhen: (previous, current) =>
                      previous.isSuccess != current.isSuccess,
                  listener: (context, state) {
                    if (state.isSuccess) {
                      GetIt.I.get<AppNavigator>().showSuccessSnackBar(
                        S.current.forgot_password_success_message,
                      );
                      GetIt.I.get<AppNavigator>().pop();
                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            label: S.current.forgot_password_send_button,
                            labelTextStyle: AppTextStyle.bold16(
                              color: Colors.white,
                            ),
                            backgroundColor: AppColors.current.primaryDefault,
                            onPressed: () {
                              context.read<ForgotPasswordBloc>().add(
                                const OnFirstSubmitEvent(),
                              );
                              if (_formKey.currentState?.validate() ?? false) {
                                widget.onSendPress.call();
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
}
