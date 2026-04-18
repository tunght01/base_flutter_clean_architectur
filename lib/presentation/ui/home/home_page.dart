import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/presentation/base/base_page_state.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/widget/empty_widget.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/home/bloc/home_bloc.dart';
import 'package:soft_dream_test/presentation/ui/home/bloc/home_event.dart';
import 'package:soft_dream_test/presentation/ui/home/bloc/home_state.dart';
import 'package:soft_dream_test/presentation/ui/home/widget/product_item_widget.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.listProduct != null) {
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
                            const SizedBox(height: 4),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {},
        child: Icon(Icons.add, color: AppColors.current.primaryDefault),
      ),
    );
  }
}
