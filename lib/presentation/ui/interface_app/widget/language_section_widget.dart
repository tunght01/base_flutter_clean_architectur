import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/ui/interface_app/widget/languege_tile_widget.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

class LanguageSectionWidget extends StatelessWidget {
  final LanguageCode languageCode;
  const LanguageSectionWidget({
    super.key,
    required this.languageCode,
    required this.onSelected,
  });

  final ValueChanged<LanguageCode> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.current.backgroundCard,
        borderRadius: BorderRadius.circular(Dimens.d16),
        border: Border.all(color: AppColors.current.border, width: 1),
      ),
      child: Column(
        children: List.generate(LanguageCode.values.length, (index) {
          final item = LanguageCode.values[index];
          final isLast = index == LanguageCode.values.length - 1;
          final isSelected = item == languageCode;
          return LanguageTile(
            item: item,
            isSelected: isSelected,
            showDivider: !isLast,
            onTap: () => onSelected(item),
          );
        }),
      ),
    );
  }
}

