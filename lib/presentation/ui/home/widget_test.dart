import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/dialog/app_dialog.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/common_view/widget/empty_widget.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_themes.dart';
import 'package:soft_dream_test/presentation/ui/home/widget/product_item_widget.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/widget/product_action_dialogs.dart';

import 'bloc/bloc.dart';

class WidgetTest extends StatefulWidget {
  const WidgetTest({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageStateKeepAlive<WidgetTest, HomeBloc> {
  final TextEditingController _searchController = TextEditingController();
  bool _filterInStock = false;
  String _searchQuery = '';

  @override
  void initState() {
    bloc.add(HomeInitEvent());
    _searchController.addListener(() {
      setState(
        () => _searchQuery = _searchController.text.trim().toLowerCase(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductEntity> _applyFilter(List<ProductEntity>? source) {
    if (source == null) return [];
    return source.where((p) {
      final matchSearch =
          _searchQuery.isEmpty || p.name.toLowerCase().contains(_searchQuery);
      final matchStock = !_filterInStock || p.inStock;
      return matchSearch && matchStock;
    }).toList();
  }

  @override
  Widget buildPage(BuildContext context) {
    final colors = Theme.of(context).appColor;

    return CommonScaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ── Search + filter bar ──────────────────────────────────────
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
                  Container(
                    height: Dimens.d44,
                    decoration: BoxDecoration(
                      color: colors.backgroundCard,
                      borderRadius: BorderRadius.circular(Dimens.d12),
                      border: Border.all(color: colors.border),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: AppTextStyle.regular14(color: colors.textBody),
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm sản phẩm...',
                        hintStyle: AppTextStyle.regular14(
                          color: colors.textDisable,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: colors.iconSubdued,
                          size: Dimens.d20,
                        ),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  Icons.clear_rounded,
                                  color: colors.iconSubdued,
                                  size: Dimens.d18,
                                ),
                                onPressed: () => _searchController.clear(),
                              )
                            : null,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: Dimens.d12,
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  kSpacingHeight8,
                  // Filter chips row
                  Row(
                    children: [
                      _FilterChip(
                        label: S.current.in_stock,
                        icon: Icons.inventory_2_outlined,
                        isSelected: _filterInStock,
                        activeColor: colors.green500,
                        onTap: () =>
                            setState(() => _filterInStock = !_filterInStock),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Product list ─────────────────────────────────────────────
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
                      final filtered = _applyFilter(state.listProduct);

                      // Data loaded but no match → show "no result"
                      if (state.listProduct != null &&
                          state.listProduct!.isNotEmpty &&
                          filtered.isEmpty) {
                        return _NoResultWidget(colors: colors);
                      }

                      if (filtered.isNotEmpty) {
                        return ListView.separated(
                          itemCount: filtered.length,
                          padding: const EdgeInsets.only(bottom: Dimens.d80),
                          itemBuilder: (context, index) {
                            final product = filtered[index];
                            return ProductItemWidget(
                              product: product,
                              onTap: () async {
                                bloc.add(OnPressProductEvent(product.id!));
                              },
                            );
                          },
                          separatorBuilder: (_, __) => kSpacingHeight4,
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

// ─── Filter Chip widget ───────────────────────────────────────────────────────

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.activeColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final Color activeColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColor;
    final bg = isSelected
        ? activeColor.withValues(alpha: 0.15)
        : colors.backgroundCard;
    final borderColor = isSelected ? activeColor : colors.border;
    final fgColor = isSelected ? activeColor : colors.textSubTitle;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.d10,
          vertical: Dimens.d6,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(Dimens.d20),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: Dimens.d14, color: fgColor),
            kSpacingWidth4,
            Text(label, style: AppTextStyle.medium12(color: fgColor)),
            if (isSelected) ...[
              kSpacingWidth4,
              Icon(Icons.check_rounded, size: Dimens.d13, color: fgColor),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── No result widget ─────────────────────────────────────────────────────────

class _NoResultWidget extends StatelessWidget {
  const _NoResultWidget({required this.colors});

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: Dimens.d48,
            color: colors.iconWeak,
          ),
          kSpacingHeight12,
          Text(
            'Không tìm thấy sản phẩm phù hợp',
            style: AppTextStyle.medium14(color: colors.textSubTitle),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
