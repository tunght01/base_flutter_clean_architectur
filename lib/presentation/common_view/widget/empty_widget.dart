import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.message, this.icon});
  final String? message;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.d40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? Assets.icons.ilEmpty.svg(),
            kSpacingHeight8,
            Text(
              message ?? S.current.no_records_yet,
              style: AppTextStyle.medium12(
                color: AppColors.of(context).textTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
