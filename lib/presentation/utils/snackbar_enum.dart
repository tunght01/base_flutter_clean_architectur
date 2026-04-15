import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';

enum SnackbarType {
  error,
  success;

  const SnackbarType();
}

extension SnackbarTypeX on SnackbarType {
  Color getColor(BuildContext context) {
    switch (this) {
      case SnackbarType.error:
        return AppColors.of(context).errorDefault;
      case SnackbarType.success:
        return AppColors.of(context).successDefault;
    }
  }

  Color getBackGroundColor(BuildContext context) {
    switch (this) {
      case SnackbarType.error:
        return AppColors.of(context).mobileToastError;
      case SnackbarType.success:
        return AppColors.of(context).mobileToastSuccess;
    }
  }

  Color getBorderColor(BuildContext context) {
    switch (this) {
      case SnackbarType.error:
        return AppColors.of(context).errorDefault;
      case SnackbarType.success:
        return AppColors.of(context).mobileButtonGreen;
    }
  }

  Widget get icon {
    switch (this) {
      case SnackbarType.error:
        return Icon(Icons.error);
      case SnackbarType.success:
        return Icon(Icons.done);
    }
  }
}
