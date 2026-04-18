import 'package:flutter/material.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/shared/utils/num_utils.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product, this.onTap});

  final ProductEntity product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.d16),
      decoration: BoxDecoration(
        color: AppColors.current.backgroundPrimary,
        borderRadius: BorderRadius.circular(Dimens.d10),
        border: Border.all(color: AppColors.current.border, width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimens.d10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: AppTextStyle.bold12(
                      color: AppColors.current.textTitle,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                kSpacingWidth12,
                _buildStatusBadge(),
              ],
            ),

            if (product.description.isNotEmpty) ...[
              Text(
                product.description,
                style: AppTextStyle.regular10(
                  color: AppColors.current.textSubTitle,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            Divider(color: AppColors.current.border),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  product.price.toPrice(),
                  style: AppTextStyle.bold10(
                    color: AppColors.current.primaryDefault,
                  ),
                ),
                Text(
                  product.createdAt,
                  style: AppTextStyle.medium10(
                    color: AppColors.current.textSubTitle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    final bool isAvailable = product.inStock;
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
        borderRadius: BorderRadius.circular(Dimens.d8),
      ),
      child: Text(text, style: AppTextStyle.semiBold10(color: textColor)),
    );
  }
}
