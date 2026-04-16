import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({
    required this.onChanged,
    super.key,
    this.initValue = false,
    this.title,
    this.disable = false,
    this.minusIcon = false,
    this.content,
    this.textColor,
    this.crossAxisAlignment,
    this.child,
    this.titleStyle,
    this.contentStyle,
    this.iconSize = 16,
    this.mainAxisAlignment,
  });

  final String? title, content;
  final Color? textColor;
  final double iconSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Widget? child;
  final bool disable, minusIcon, initValue;
  final ValueChanged<bool> onChanged;
  final TextStyle? titleStyle, contentStyle;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late bool value;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CheckboxWidget oldWidget) {
    value = widget.initValue;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment:
          widget.crossAxisAlignment ??
          (widget.content == null
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start),
      children: [
        InkResponse(
          onTap: widget.disable
              ? null
              : () {
                  setState(() {
                    value = !value;
                    widget.onChanged(value);
                  });
                },
          radius: widget.iconSize + 2,
          child: SizedBox(
            height: widget.iconSize,
            width: widget.iconSize,
            child: checkIcon,
          ),
        ),
        if (widget.child != null) ...[
          kSpacingWidth8,
          Flexible(child: widget.child!),
        ] else if (widget.title != null || widget.content != null) ...[
          kSpacingWidth8,
          Flexible(
            child: Column(
              children: [
                if (widget.title != null)
                  Text(
                    widget.title!,
                    style:
                        (widget.titleStyle ??
                                AppTextStyle.medium14(
                                  color: AppColors.current.textBody,
                                ))
                            .copyWith(
                              color: widget.disable
                                  ? AppColors.current.textDisable
                                  : widget.textColor,
                            ),
                  ),
                if (widget.title != null && widget.content != null)
                  kSpacingHeight4,
                if (widget.content != null)
                  Text(
                    widget.content!,
                    style:
                        (widget.contentStyle ??
                                AppTextStyle.medium14(
                                  color: AppColors.current.textSubTitle,
                                ))
                            .copyWith(
                              color: widget.disable
                                  ? AppColors.current.textDisable
                                  : widget.textColor,
                            ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget get checkIcon {
    if (value) {
      return widget.disable
          ? Icon(Icons.check_box_outline_blank, size: 16)
          : Icon(
              Icons.check_box,
              color: AppColors.current.primaryDefault,
              size: 16,
            );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: widget.disable
            ? null
            : Border.all(color: AppColors.current.iconMedium, width: 1),
        color: widget.disable ? AppColors.current.surfaceSecondary : null,
      ),
    );
  }
}
