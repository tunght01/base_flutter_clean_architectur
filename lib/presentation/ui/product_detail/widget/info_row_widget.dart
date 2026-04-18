
import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class InfoRowWidget extends StatelessWidget {
  const InfoRowWidget({super.key,  this.label = '',  this.value = ''});
 final String label;final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.medium12(color: AppColors.current.textTitle),
        ),
        Text(
          value,
          style: AppTextStyle.medium12(color: AppColors.current.textTitle),
        ),
      ],
    );
  }
}
