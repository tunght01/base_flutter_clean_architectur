import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/app_bar/base_app_bar.dart';
import 'package:soft_dream_test/presentation/common_view/button/app_button.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/common_view/widget/empty_widget.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_bloc.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_event.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_state.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/widget/info_row_widget.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/widget/status_product_widget.dart';
import '../../../shared/utils/num_utils.dart';

@RoutePage()
class ProductDetailPage extends StatefulWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BasePageState<ProductDetailPage, DetailProductBloc> {
  @override
  void initState() {
    bloc.add(DetailProductInitEvent(widget.id));
    super.initState();
  }

  @override
  Widget buildPageListeners({required Widget child}) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DetailProductBloc, DetailProductState>(
          listenWhen: (previous, current) {
            return previous.id != current.id;
          },
          listener: (_, state) {
            bloc.add(const GetProductEvent());
          },
        ),
      ],
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.current.backgroundPrimary,
      appBar: BaseAppBar(
        centerTitle: true,
        label: S.current.product_detail,

        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.edit_rounded,
              color: AppColors.current.primaryDefault,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              final response = await showDeleteConfirm(context);
              if (response is bool && response) {
                bloc.add(RemoveProductEvent());
              }
            },
            icon: const Icon(
              Icons.delete_sweep_rounded,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimens.d16),
        child: BlocBuilder<DetailProductBloc, DetailProductState>(
          builder: (context, state) {
            final product = state.product;
            if (product != null) {
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
                        style: AppTextStyle.bold18(
                          color: AppColors.current.textTitle,
                        ),
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
            return EmptyWidget();
          },
        ),
      ),
    );
  }

  Future<bool?> showDeleteConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.current.backgroundPrimary ?? Colors.white,
          title: Text(
            S.current.confirm_remove,
            style: AppTextStyle.bold20(color: AppColors.current.textTitle),
          ),
          content: Text(
            S.current.info_confirm_remove,
            style: AppTextStyle.semiBold14(color: AppColors.current.textTitle),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    backgroundColor: AppColors.current.buttonDisable,
                    label: S.current.cancel,
                    labelTextStyle: AppTextStyle.semiBold12(
                      color: AppColors.current.textDisable,
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ),
                kSpacingWidth6,
                Expanded(
                  child: AppButton(
                    label: S.current.confirm,
                    labelTextStyle: AppTextStyle.semiBold12(
                      color: AppColors.current.textTitle,
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
