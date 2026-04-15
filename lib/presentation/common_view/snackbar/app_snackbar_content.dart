import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/utils/snackbar_enum.dart';

class AppSnackbarContent {
  /// `IMPORTANT NOTE` for SnackBar properties before putting this in `content`
  /// backgroundColor: Colors.transparent
  /// behavior: SnackBarBehavior.floating
  /// elevation: 0.0

  /// /// `IMPORTANT NOTE` for MaterialBanner properties before putting this in `content`
  /// backgroundColor: Colors.transparent
  /// forceActionsBelow: true,
  /// elevation: 0.0
  /// [inMaterialBanner = true]

  /// title is the header String that will show on top
  final String? title;

  final Widget? titleWidget;

  /// message String is the body message which shows only 2 lines at max
  final String? message;

  final Widget? messageWidget;

  final TextStyle? titleStyle;

  final TextStyle? messageStyle;

  /// contentType will reflect the overall theme of SnackBar/MaterialBanner: failure, success, help, warning
  final SnackbarType snackbarType;

  /// if you want to use this in materialBanner
  final bool inMaterialBanner;

  /// if you want to customize the font size of the title
  final double? titleFontSize;

  /// if you want to customize the font size of the message
  final double? messageFontSize;

  const AppSnackbarContent({
    this.titleFontSize,
    this.messageFontSize,
    this.title,
    this.message,
    this.titleWidget,
    this.messageWidget,
    required this.snackbarType,
    this.titleStyle,
    this.messageStyle,
    this.inMaterialBanner = false,
  });
}
