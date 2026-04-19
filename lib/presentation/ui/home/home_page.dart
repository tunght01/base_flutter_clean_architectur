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
import 'package:soft_dream_test/presentation/common_view/widget/empty_widget.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/ui/home/widget/product_item_widget.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/widget/product_action_dialogs.dart';

import 'bloc/bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageStateKeepAlive<HomePage, HomeBloc> {
  @override
  void initState() {
    bloc.add(HomeInitEvent());
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            final completer = Completer<void>();
            bloc.add(HomePageRefreshed(completer));

            return completer.future;
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (pre, cur) => pre.listProduct != cur.listProduct,
                    builder: (context, state) {
                      if (state.listProduct != null &&
                          state.listProduct!.isNotEmpty) {
                        return ListView.separated(
                          itemCount: state.listProduct!.length,
                          itemBuilder: (context, index) {
                            final product = state.listProduct?[index];
                            if (product == null) return const SizedBox.shrink();
                            return ProductItemWidget(
                              product: product,
                              onTap: () async {
                                bloc.add(OnPressProductEvent(product.id!));
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              kSpacingHeight4,
                        );
                      }

                      return EmptyWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
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
