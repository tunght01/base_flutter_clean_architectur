import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

import '../spacing/spacing_const.dart';

class BottomNavItem extends StatelessWidget {
  final BottomTab item;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItem({super.key, required this.isSelected, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.d8, horizontal: Dimens.d6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
          gradient: isSelected ? const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color.fromRGBO(15, 108, 189, 0.0), Color.fromRGBO(15, 108, 189, 0.26)], stops: [0.1833, 1]) : null,
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 20, height: 20, child: isSelected ? item.activeIcon : item.icon),
              kSpacingHeight4,
              Text(
                item.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: AppTextStyle.custom(height: 12 / 9, fontSize: 9, responsive: false, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500, color: isSelected ? AppColors.of(context).primaryDefault : AppColors.of(context).textTitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
