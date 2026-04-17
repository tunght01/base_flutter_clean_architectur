import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';

class AppLeading extends StatelessWidget {
  const AppLeading({super.key, this.onPressed, this.icon});

  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          icon ??
          Icon(Icons.arrow_back, color: AppColors.current.primaryDefault),
      onPressed:
          onPressed ??
          () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
    );
  }
}
