import 'package:flutter/material.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/widget/info_row_widget.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/widget/status_product_widget.dart';
import 'package:soft_dream_test/shared/utils/num_utils.dart';

class ProductDetailItemWidget extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailItemWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(child: Assets.images.imgLogo.image()),
        kSpacingHeight24,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: AppTextStyle.bold14(
                      color: AppColors.current.textTitle,
                    ),
                  ),
                ),
                kSpacingWidth16,
                StatusProductWidget(isAvailable: product.inStock),
              ],
            ),
            kSpacingHeight12,
            Text(
              product.price.toPrice(),
              style: AppTextStyle.bold12(
                color: AppColors.current.primaryDefault,
              ),
            ),

            kSpacingHeight12,
            Divider(color: AppColors.current.border),
            kSpacingHeight12,

            Text(
              S.current.description_product,
              style: AppTextStyle.bold18(color: AppColors.current.textTitle),
            ),
            const SizedBox(height: 12),

            Text(
              product.description,
              style: AppTextStyle.medium12(
                color: AppColors.current.textSubTitle,
              ),
            ),

            kSpacingHeight8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoRowWidget(
                  label: S.current.create_at_repository,
                  value: product.createdAt,
                ),
                const SizedBox(height: 8),
                InfoRowWidget(
                  label: S.current.update_at_last,
                  value: product.updatedAt,
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ],
    );
  }
}
