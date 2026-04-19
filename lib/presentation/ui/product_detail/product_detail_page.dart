import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/app_bar/base_app_bar.dart';
import 'package:soft_dream_test/presentation/common_view/dialog/app_dialog.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/widget/empty_widget.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_bloc.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_event.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_bloc.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_event.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_state.dart';

import 'widget/product_action_dialogs.dart';
import 'widget/product_detail_item_widget.dart';

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
    getIt<AccountInfoBloc>().add(UserEditProductEvent(false));
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
            onPressed: () async {
              final response = await navigator.showAlertDialog(
                AppDialog(
                  title: S.current.notification,
                  content: ProductFormSheet(initialProduct: bloc.state.product),
                ),
                barrierDismissible: true,
              );
              if (response is ProductEntity) {
                bloc.add(UpdateProductEvent(response));
              }
            },
            icon: Icon(
              Icons.edit_rounded,
              color: AppColors.current.primaryDefault,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              final response = await navigator.showAlertDialog(
                AppDialog(
                  title: S.current.notification,
                  message: S.current.info_confirm_remove,
                  actionTitle: S.current.confirm,
                  actionResult: true,
                  cancelTitle: S.current.cancel,
                ),
                barrierDismissible: true,
              );
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
              return ProductDetailItemWidget(product);
            }
            return EmptyWidget();
          },
        ),
      ),
    );
  }
}
