import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/button/app_button.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.message,
    this.title,
    this.icon,
    this.actionTitle,
    this.cancelTitle,
    this.action,
    this.cancel,
    this.bottomIcon,
    this.insetPadding,
    this.padding,
    this.content,
    this.topButtonTitle,
    this.bottomButtonTitle,
    this.topButtonAction,
    this.bottomButtonAction,
    this.titleStyle,
    this.messageStyle,
    this.cancelColor,
    this.actionColor,
    this.cancelResult,
    this.actionResult,
    this.actionResultBuilder,
    this.actionTextStyle,
    this.cancelTextStyle,
    this.barrierDismissible = true,
  });

  final String? title;
  final String? message;
  final String? actionTitle;
  final String? cancelTitle;
  final String? topButtonTitle;
  final String? bottomButtonTitle;
  final Widget? icon;
  final Widget? bottomIcon;
  final Widget? content;
  final VoidCallback? action;
  final VoidCallback? cancel;
  final VoidCallback? topButtonAction;
  final VoidCallback? bottomButtonAction;
  final EdgeInsets? insetPadding;
  final EdgeInsets? padding;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final TextStyle? actionTextStyle;
  final TextStyle? cancelTextStyle;
  final Color? cancelColor;
  final Color? actionColor;
  final bool barrierDismissible;
  final dynamic cancelResult;
  final dynamic actionResult;
  final dynamic Function()? actionResultBuilder;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: insetPadding ?? const EdgeInsets.all(Dimens.d24),
      child: Container(
        padding: padding ?? const EdgeInsets.all(Dimens.d24),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.current.mobileTab,
          borderRadius: BorderRadius.circular(Dimens.d24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Text(
                title!,
                textAlign: TextAlign.center,
                style:
                    titleStyle ??
                    AppTextStyle.semiBold18(color: AppColors.current.textTitle),
              ),
            if (title != null && icon != null) kSpacingHeight24,
            ?icon,
            if (message != null && icon != null) kSpacingHeight24,
            if (title != null && message != null && icon == null)
              kSpacingHeight8,
            ?content,
            if (message != null)
              Text(
                message!,
                textAlign: TextAlign.center,
                style:
                    messageStyle ??
                    AppTextStyle.medium16(color: AppColors.current.textTitle),
              ),
            if (bottomIcon != null) ...[kSpacingHeight24, bottomIcon!],
            if (actionTitle != null || cancelTitle != null) ...[
              kSpacingHeight24,
              Row(
                children: [
                  if (cancelTitle != null)
                    Expanded(
                      child: AppButton(
                        label: cancelTitle,
                        labelColor: AppColors.current.textTitle,
                        borderColor: AppColors.current.mobileStrokeTab,
                        backgroundColor: cancelColor ?? Colors.transparent,
                        labelTextStyle: cancelTextStyle,
                        onPressed: () {
                          Navigator.pop(context, cancelResult);
                          cancel?.call();
                        },
                      ),
                    ),
                  if (actionTitle != null && cancelTitle != null)
                    kSpacingWidth16,
                  if (actionTitle != null)
                    Expanded(
                      child: AppButton(
                        label: actionTitle,
                        backgroundColor: actionColor,
                        labelTextStyle: actionTextStyle,
                        onPressed: () {
                          final result = actionResultBuilder?.call();
                          Navigator.pop(context, result ?? actionResult);
                          action?.call();
                        },
                      ),
                    ),
                ],
              ),
            ],
            if (topButtonTitle != null || bottomButtonTitle != null) ...[
              kSpacingHeight32,
              if (topButtonTitle != null)
                AppButton(
                  label: topButtonTitle,
                  backgroundColor: actionColor,
                  labelTextStyle: actionTextStyle,
                  onPressed: () {
                    if (barrierDismissible) {
                      Navigator.pop(context);
                    }
                    topButtonAction?.call();
                  },
                ),
              if (topButtonTitle != null && bottomButtonTitle != null)
                kSpacingHeight16,
              if (bottomButtonTitle != null)
                AppButton(
                  label: bottomButtonTitle,
                  backgroundColor: cancelColor ?? Colors.transparent,
                  labelTextStyle: cancelTextStyle,
                  onPressed: () {
                    if (barrierDismissible) {
                      Navigator.pop(context);
                    }
                    bottomButtonAction?.call();
                  },
                ),
            ],
          ],
        ),
      ),
    );
  }
}
