import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import '../spacing/spacing_const.dart';
import 'app_leading.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.title,
    this.label,
    this.elevation,
    this.actions,
    this.centerTitle,
    this.bottom,
    this.showBackButton,
    this.automaticallyImplyLeading,
    this.leading,
    this.leadingWidth,
    this.bottomHeight,
    this.linearGradient,
    this.titleSpacing,
    this.backgroundColor,
    this.labelColor,
    this.bottomColor,
    this.primary = true,
  });

  final Widget? title;
  final String? label;
  final double? leadingWidth, bottomHeight, elevation, titleSpacing;
  final bool? centerTitle, showBackButton, automaticallyImplyLeading;
  final bool primary;
  final LinearGradient? linearGradient;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? labelColor, backgroundColor, bottomColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: linearGradient != null
          ? BoxDecoration(gradient: linearGradient)
          : BoxDecoration(
              color: backgroundColor ?? AppColors.current.mobileBackground,
            ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: elevation ?? 0,
        leadingWidth: leadingWidth,
        titleSpacing: titleSpacing ?? 0,
        primary: primary,
        leading:
            leading ??
            (showBackButton ?? Navigator.canPop(context)
                ? const AppLeading()
                : null),
        title: label != null
            ? Text(
                label!,
                style: AppTextStyle.semiBold16(
                  responsive: false,
                  color: labelColor ?? AppColors.current.textTitle,
                ),
              )
            : title,
        actions: [...actions ?? [], kSpacingWidth16],
        centerTitle: centerTitle ?? false,
        bottom:
            bottom ??
            PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                color: bottomColor ?? AppColors.current.mobileStrokeTab,
                height: 1,
              ),
            ),
        automaticallyImplyLeading:
            automaticallyImplyLeading ?? showBackButton ?? true,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottomHeight ?? 0));
}
