import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class ThemeSectionWidget extends StatelessWidget {
  const ThemeSectionWidget({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.current.backgroundCard,
        borderRadius: BorderRadius.circular(Dimens.d16),
        border: Border.all(color: AppColors.current.border, width: 1),
      ),
      child: Row(
        children: [
          _ThemeOption(
            label: S.current.dark,
            icon: Icons.dark_mode_rounded,
            isSelected: isDarkMode,
            onTap: () => onChanged(true),
            isLeft: true,
          ),
          Container(width: 1, color: AppColors.current.border),
          _ThemeOption(
            label: S.current.light,
            icon: Icons.light_mode_rounded,
            isSelected: !isDarkMode,
            onTap: () => onChanged(false),
            isLeft: false,
          ),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.isLeft,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.current.buttonPrimary;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.horizontal(
          left: isLeft ? const Radius.circular(Dimens.d16) : Radius.zero,
          right: isLeft ? Radius.zero : const Radius.circular(Dimens.d16),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.d18,
            horizontal: Dimens.d12,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? activeColor.withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.horizontal(
              left: isLeft ? const Radius.circular(Dimens.d16) : Radius.zero,
              right: isLeft ? Radius.zero : const Radius.circular(Dimens.d16),
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: Dimens.d28,
                color: isSelected ? activeColor : AppColors.current.iconSubdued,
              ),
              kSpacingHeight8,
              Text(
                label,
                style: AppTextStyle.medium14(
                  color: isSelected
                      ? activeColor
                      : AppColors.current.textSubTitle,
                ),
              ),
              kSpacingHeight6,
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: Dimens.d3,
                width: Dimens.d24,
                decoration: BoxDecoration(
                  color: isSelected ? activeColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(Dimens.d4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
