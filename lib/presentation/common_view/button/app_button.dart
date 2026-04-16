import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/utils/view_utils.dart';

import '../../resource/generated/assets.gen.dart';

class AppButton extends StatefulWidget {
  final String? label;
  final Widget? icon, iconRight;
  final Color? backgroundColor, labelColor, borderColor, disableColor;
  final double? buttonWidth, borderRadius;
  final double minWidth,
      minHeight,
      maxHeight,
      maxWidth,
      paddingHorizontal,
      paddingVertical;
  final TextStyle? labelTextStyle;
  final Future<void> Function()? onPressedSync;
  final VoidCallback? onPressed;
  final bool showLoading, isLoading, enabled;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final double betweenSpace;

  const AppButton({
    super.key,
    this.label,
    this.onPressedSync,
    this.onPressed,
    this.backgroundColor,
    this.icon,
    this.iconRight,
    this.labelColor,
    this.borderColor,
    this.showLoading = true,
    this.enabled = true,
    this.isLoading = false,
    this.minWidth = 48,
    this.minHeight = 32,
    this.maxHeight = 44,
    this.maxWidth = double.infinity,
    this.paddingHorizontal = 24,
    this.paddingVertical = 0,
    this.labelTextStyle,
    this.borderRadius,
    this.disableColor,
    this.borderRadiusGeometry,
    this.buttonWidth,
    this.betweenSpace = 8,
  });

  @override
  AppButtonState createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  late bool loading;

  @override
  void initState() {
    loading = widget.isLoading;
    super.initState();
  }

  @override
  void didUpdateWidget(AppButton oldWidget) {
    if (oldWidget.isLoading != widget.isLoading) {
      loading = widget.isLoading;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled
          ? () {
              ViewUtils.hideKeyboard(context);
              (widget.onPressed ??
                      (widget.onPressedSync == null
                          ? null
                          : () async {
                              if (loading) {
                                return;
                              } else {
                                setState(() {
                                  loading = true;
                                });
                                await widget.onPressedSync!.call();
                                setState(() {
                                  loading = false;
                                });
                              }
                            }))
                  ?.call();
            }
          : null,
      borderRadius: BorderRadius.circular(widget.borderRadius ?? Dimens.d12),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: widget.minHeight,
          minWidth: widget.minWidth,
          maxHeight: widget.maxHeight,
          maxWidth: widget.maxWidth,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                widget.borderRadiusGeometry ??
                BorderRadius.circular(widget.borderRadius ?? Dimens.d12),
            color: widget.enabled
                ? widget.backgroundColor ?? AppColors.current.primaryDefault
                : (widget.disableColor ?? AppColors.current.buttonDisable),
            border: widget.borderColor != null
                ? Border.all(color: widget.borderColor!, width: 1)
                : null,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: widget.paddingHorizontal,
            vertical: widget.paddingVertical,
          ),
          child: Align(
            child: Builder(
              builder: (context) {
                if (loading && widget.showLoading) {
                  return SizedBox.square(
                    dimension: 24,
                    child: Lottie.asset(
                      Assets.json.loadingButton,
                      width: 24,
                      height: 24,
                      fit: BoxFit.fill,
                      // options: LottieOptions(enableMergePaths: true),
                    ),
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (widget.icon != null) widget.icon!,
                    if (widget.icon != null && widget.label != null)
                      SizedBox(width: widget.betweenSpace),
                    if (widget.label != null)
                      Flexible(
                        child: Text(
                          widget.label!,
                          style:
                              widget.labelTextStyle ??
                              AppTextStyle.bold16(
                                color:
                                    widget.labelColor ??
                                    (widget.enabled
                                        ? AppColors.current.textBody
                                        : AppColors.current.textDisable),
                              ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (widget.iconRight != null && widget.label != null)
                      SizedBox(width: widget.betweenSpace),
                    if (widget.iconRight != null) widget.iconRight!,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
