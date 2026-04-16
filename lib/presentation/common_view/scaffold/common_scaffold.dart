import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/shimmer/shimmer.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/utils/view_utils.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.drawer,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.hideKeyboardWhenTouchOutside = false,
    this.resizeToAvoidBottomInset,
    this.showVectorBottom = false,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool hideKeyboardWhenTouchOutside;
  final bool? resizeToAvoidBottomInset;
  final bool showVectorBottom;

  @override
  Widget build(BuildContext context) {
    final scaffold = Stack(
      children: [
        Theme(
          data: bottomSheet != null ? Theme.of(context) : Theme.of(context),
          child: Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            backgroundColor: backgroundColor ?? AppColors.current.mobileBackground,
            body: Shimmer(child: body),
            appBar: appBar,
            drawer: drawer,
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButton: floatingActionButton,
            bottomSheet: bottomSheet,
          ),
        ),
      ],
    );

    return hideKeyboardWhenTouchOutside
        ? GestureDetector(
            onTap: () => ViewUtils.hideKeyboard(context),
            child: scaffold,
          )
        : scaffold;
  }
}
