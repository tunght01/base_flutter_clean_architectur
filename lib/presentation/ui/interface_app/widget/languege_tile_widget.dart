import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';


class LanguageTile extends StatelessWidget {


  const LanguageTile({super.key,
    required this.item,
    required this.isSelected,
    required this.showDivider,
    required this.onTap,
  });

  final LanguageCode item;
  final bool isSelected;
  final bool showDivider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.current.buttonPrimary;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.vertical(
            top: showDivider ? Radius.zero : const Radius.circular(Dimens.d16),
            bottom: showDivider
                ? const Radius.circular(Dimens.d16)
                : Radius.zero,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.d16,
              vertical: Dimens.d14,
            ),
            child: Row(
              children: [
                Text(item.flag, style: const TextStyle(fontSize: 24)),
                kSpacingWidth12,
                Expanded(
                  child: Text(
                    item.title,
                    style: AppTextStyle.medium14(
                      color: isSelected
                          ? activeColor
                          : AppColors.current.textBody,
                    ),
                  ),
                ),
                // Check indicator
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: isSelected
                      ? Icon(
                    Icons.check_circle_rounded,
                    key: const ValueKey('check'),
                    color: activeColor,
                    size: Dimens.d22,
                  )
                      : Icon(
                    Icons.radio_button_unchecked_rounded,
                    key: const ValueKey('uncheck'),
                    color: AppColors.current.iconWeak,
                    size: Dimens.d22,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            indent: Dimens.d16,
            endIndent: Dimens.d16,
            color: AppColors.current.border,
          ),
      ],
    );
  }
}

