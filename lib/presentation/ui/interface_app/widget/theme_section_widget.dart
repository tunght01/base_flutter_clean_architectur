import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/ui/interface_app/widget/theme_option_widget.dart';

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
          ThemeOption(
            label: S.current.dark,
            icon: Icons.dark_mode_rounded,
            isSelected: isDarkMode,
            onTap: () => onChanged(true),
            isLeft: true,
          ),
          Container(width: 1, color: AppColors.current.border),
          ThemeOption(
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

