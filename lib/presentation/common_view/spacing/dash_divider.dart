import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';

class DashDivider extends StatelessWidget {
  const DashDivider({
    super.key,
    this.height = 18,
    this.dashHeight = 1,
    this.color,
    this.dashWidth = 4.0,
  });
  final double height;
  final double dashHeight;
  final double dashWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color ?? AppColors.of(context).border,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
