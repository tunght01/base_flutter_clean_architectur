import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/dialog/app_dialog.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/common_view/text_field/app_text_form_field.dart';
import 'package:soft_dream_test/presentation/common_view/widget/empty_widget.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_themes.dart';
import 'package:soft_dream_test/presentation/ui/home/widget/filter_product_widget.dart';
import 'package:soft_dream_test/presentation/ui/home/widget/product_item_widget.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/widget/product_action_dialogs.dart';

import 'bloc/bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageStateKeepAlive<HomePage, HomeBloc> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    bloc.add(HomeInitEvent());
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget buildPageListeners({required Widget child}) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (previous, current) =>
              previous.isSelectedInStock != current.isSelectedInStock ||
              previous.query != current.query,
          listener: (context, state) {
            bloc.add(FilterProductEvent());
          },
        ),
      ],
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    final colors = Theme.of(context).appColor;

    return CommonScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Dimens.d16,
                Dimens.d12,
                Dimens.d16,
                Dimens.d8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search field
                  AppTextFormField(
                    controller: _searchController,
                    hintText: S.current.search_product,
                    isClear: true,
                    fillColor: AppColors.current.gray100,
                    style: AppTextStyle.regular14(color: colors.textBody),
                    onChanged: (value) =>
                        bloc.add(OnUpdateQueryEvent(value ?? '')),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.search_rounded,
                        color: colors.iconSubdued,
                        size: Dimens.d16,
                      ),
                    ),
                  ),
                  kSpacingHeight8,
                  // Filter chips row
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (pre, cur) =>
                        pre.isSelectedInStock != cur.isSelectedInStock,
                    builder: (context, state) {
                      return FilterProductWidget(
                        label: S.current.in_stock,
                        icon: Icons.inventory_2_outlined,
                        isSelected: state.isSelectedInStock,
                        activeColor: colors.green500,
                        onTap: () {
                          bloc.add(OnSelectedInStockEvent());
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  final completer = Completer<void>();
                  bloc.add(HomePageRefreshed(completer));
                  return completer.future;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.d16),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (pre, cur) => pre.listProduct != cur.listProduct,
                    builder: (context, state) {
                      if (state.listProduct != null &&
                          (state.listProduct?.isNotEmpty ?? false)) {
                        return ListView.separated(
                          itemCount: state.listProduct!.length,
                          padding: const EdgeInsets.only(bottom: Dimens.d80),
                          itemBuilder: (context, index) {
                            final product = state.listProduct![index];
                            return ProductItemWidget(
                              product: product,
                              onTap: () async {
                                bloc.add(OnPressProductEvent(product.id!));
                              },
                            );
                          },
                          separatorBuilder: (_, _) => kSpacingHeight4,
                        );
                      }
                      return EmptyWidget();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey.withValues(alpha: 0.2),
                width: 1.2,
              ),
            ),
            child: FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              backgroundColor: Colors.transparent,
              onPressed: () async {
                final response = await navigator.showAlertDialog(
                  barrierDismissible: true,
                  AppDialog(content: ProductFormSheet()),
                );
                if (response is ProductEntity) {
                  bloc.add(CreateProductEvent(response));
                }
              },
              child: Icon(Icons.add, color: AppColors.current.primaryDefault),
            ),
          ),
        ),
      ),
    );
  }
}
