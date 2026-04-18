import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class StatusProductWidget extends StatelessWidget {
  final bool isAvailable;

  const StatusProductWidget({super.key, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isAvailable
        ? AppColors.current.green500.withValues(alpha: 0.3)
        : AppColors.current.red500.withValues(alpha: 0.3);
    final Color textColor = isAvailable
        ? AppColors.current.green500
        : AppColors.current.red500;
    final String text = isAvailable ? S.current.in_stock : S.current.out_stock;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.d5,
        vertical: Dimens.d5,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isAvailable ? Icons.check_circle_rounded : Icons.cancel_rounded,
            size: Dimens.d16,
            color: textColor,
          ),
          const SizedBox(width: Dimens.d4),
          Text(text, style: AppTextStyle.bold14(color: textColor)),
        ],
      ),
    );
  }
}
