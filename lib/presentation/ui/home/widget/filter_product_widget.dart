import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class FilterProductWidget extends StatelessWidget {
  const FilterProductWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.activeColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final Color activeColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = isSelected
        ? activeColor.withValues(alpha: 0.15)
        : AppColors.of(context).backgroundCard;
    final borderColor = isSelected ? activeColor : AppColors.of(context).border;
    final fgColor = isSelected
        ? activeColor
        : AppColors.of(context).textSubTitle;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.d10,
          vertical: Dimens.d6,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(Dimens.d20),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: Dimens.d14, color: fgColor),
            kSpacingWidth4,
            Text(label, style: AppTextStyle.medium12(color: fgColor)),
            if (isSelected) ...[
              kSpacingWidth4,
              Icon(Icons.check_rounded, size: Dimens.d13, color: fgColor),
            ],
          ],
        ),
      ),
    );
  }
}
