import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class RowInfoWidget extends StatelessWidget {
  const RowInfoWidget({
    required this.label,
    this.showPadding = true,
    super.key,
    this.onTap,
    this.icon,
    this.rightContent,
    this.showSuffixIcon = true,
    this.colorLabel,
    this.padding,
    this.textStyleLabel,
    this.maxLine,
  });

  final String label;
  final Widget? icon;
  final Widget? rightContent;
  final VoidCallback? onTap;
  final bool showSuffixIcon;
  final bool showPadding;
  final Color? colorLabel;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyleLabel;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Dimens.d12),
      child: Padding(
        padding: (showPadding)
            ? padding ??
                  const EdgeInsets.symmetric(
                    vertical: Dimens.d12,
                    horizontal: Dimens.d16,
                  )
            : EdgeInsets.zero,
        child: Row(
          children: [
            if (icon != null) ...[icon!, kSpacingWidth8],
            Expanded(
              child: Text(
                label,
                style:
                    textStyleLabel ??
                    AppTextStyle.regular14(
                      color: colorLabel ?? AppColors.of(context).textTitle,
                    ),
                maxLines: maxLine,
                overflow: maxLine != null ? TextOverflow.ellipsis : null,
              ),
            ),
            if (rightContent != null) ...[kSpacingWidth4, rightContent!],
            if (showSuffixIcon) ...[
              kSpacingWidth4,
              Icon(Icons.arrow_forward_ios_rounded, size: Dimens.d16),
            ],
          ],
        ),
      ),
    );
  }
}
