import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/shared/constants/duration_constants.dart';

import '../spacing/spacing_const.dart';

class AppTextFormField extends FormField<String> {
  final TextEditingController? controller;
  AppTextFormField({
    super.key,
    super.initialValue,
    FocusNode? focusNode,
    VoidCallback? onTap,
    VoidCallback? suffixIconTap,
    String? labelText,
    String? title,
    String? hintText,
    String? errorText,
    String? successText,
    Color? hintTextColor,
    Color? disabledColor,
    Color? cursorColor,
    Color? errorTextColor,
    Color? successTextColor,
    Color? titleColor,
    Color? fillColor,
    Color? borderColor,
    TextStyle? style,
    super.onSaved,
    super.validator,
    bool enabled = true,
    bool isError = false,
    bool readOnly = false,
    bool required = false,
    bool isPassword = false,
    bool isClear = false,
    bool enableInteractiveSelection = true,
    Widget? suffix,
    String? suffixIconPath,
    Widget? prefix,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? widgetRight,
    this.controller,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    int? maxLine,
    int? minLines,
    double suffixIconSize = 16,
    double? radius,
    bool autoValidate = false,
    bool alwaysValidate = false,
    ValueChanged<String?>? onChanged,
    ValueChanged<String?>? onSubmitted,
    bool? autoFocus,
    TextStyle? hintStyle,
    TextInputAction? textInputAction,
    EdgeInsets? contentPadding,
    TextAlign textAlign = TextAlign.start,
  }) : super(
         autovalidateMode: alwaysValidate
             ? AutovalidateMode.always
             : autoValidate
             ? AutovalidateMode.onUserInteraction
             : AutovalidateMode.disabled,
         builder: (FormFieldState field) {
           final AppTextFormFieldState state = field as AppTextFormFieldState;
           final bool hasError =
               state.errorText != null || errorText != null || isError;
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               if (labelText != null) ...[
                 Text(
                   labelText,
                   style: AppTextStyle.medium12(
                     color: AppColors.current.textSubTitle,
                   ),
                 ),
                 kSpacingHeight4,
               ],
               Row(
                 children: [
                   Expanded(
                     child: IntrinsicWidth(
                       child: TextFormField(
                         key: key,
                         onTap: onTap,
                         textAlignVertical: TextAlignVertical.center,
                         autocorrect: false,
                         autofocus: autoFocus ?? false,
                         enableInteractiveSelection: enableInteractiveSelection,
                         cursorColor:
                             cursorColor ?? AppColors.current.textSubTitle,
                         textAlign: textAlign,
                         focusNode: focusNode,
                         obscureText: isPassword ? state._obscureText : false,
                         obscuringCharacter: '*',
                         readOnly: readOnly,
                         minLines: minLines ?? 1,
                         maxLines: maxLine ?? 1,
                         onTapOutside: (PointerDownEvent event) {
                           FocusManager.instance.primaryFocus?.unfocus();
                         },
                         controller: state.textEditingController,
                         style:
                             style ??
                             AppTextStyle.regular14(
                               color: enabled
                                   ? AppColors.current.textTitle
                                   : AppColors.current.textDisable,
                             ),
                         textInputAction: textInputAction,
                         keyboardType: inputType ?? TextInputType.text,
                         inputFormatters: [
                           ...inputFormatters ?? [],
                           LengthLimitingTextInputFormatter(maxLength),
                         ],
                         onFieldSubmitted: (text) {
                           if (autoValidate) {
                             state._onChangeHandler(text, onSubmitted);
                           } else {
                             state.didChange(text);
                             if (onSubmitted != null) {
                               onSubmitted(text);
                             }
                           }
                         },
                         onChanged: (text) {
                           if (autoValidate) {
                             state._onChangeHandler(text, onChanged);
                           } else {
                             state.didChange(text);
                             if (onChanged != null) {
                               onChanged(text);
                             }
                           }
                           if (isClear) {
                             state._onChangeClear(text);
                           }
                         },
                         decoration: const InputDecoration()
                             .applyDefaults(
                               Theme.of(state.context).inputDecorationTheme,
                             )
                             .copyWith(
                               hintText: hintText,
                               label: title != null
                                   ? Row(
                                       crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                         Text(
                                           title,
                                           style: AppTextStyle.medium14(
                                             color: enabled
                                                 ? titleColor ??
                                                       AppColors
                                                           .current
                                                           .textSubTitle
                                                 : AppColors
                                                       .current
                                                       .textDisable,
                                           ),
                                         ),
                                         if (required)
                                           Text(
                                             '*',
                                             style: AppTextStyle.medium14(
                                               color: AppColors
                                                   .current
                                                   .errorDefault,
                                             ),
                                           ),
                                       ],
                                     )
                                   : null,
                               fillColor:
                                   fillColor ?? AppColors.current.mobileTab,
                               hintStyle:
                                   hintStyle ??
                                   AppTextStyle.regular14(
                                     color: enabled
                                         ? hintTextColor ??
                                               AppColors.current.textSubTitle
                                         : disabledColor ??
                                               AppColors.current.textDisable,
                                   ),
                               contentPadding:
                                   contentPadding ??
                                   const EdgeInsets.symmetric(
                                     vertical: Dimens.d12,
                                     horizontal: Dimens.d16,
                                   ),
                               prefixIconConstraints: const BoxConstraints(),
                               enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(radius ?? Dimens.d12),
                                 ),
                                 borderSide: BorderSide(
                                   color: borderColor ?? Colors.transparent,
                                   width: borderColor != null ? 1 : 0,
                                   style: borderColor != null
                                       ? BorderStyle.solid
                                       : BorderStyle.none,
                                 ),
                               ),
                               disabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(radius ?? Dimens.d12),
                                 ),
                                 borderSide: BorderSide(
                                   color: borderColor ?? Colors.transparent,
                                   width: borderColor != null ? 1 : 0,
                                   style: borderColor != null
                                       ? BorderStyle.solid
                                       : BorderStyle.none,
                                 ),
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(radius ?? Dimens.d12),
                                 ),
                                 borderSide: BorderSide(
                                   color:
                                       borderColor ?? AppColors.current.border,
                                   width: borderColor != null ? 1 : 0,
                                 ),
                               ),
                               errorBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(radius ?? Dimens.d12),
                                 ),
                                 borderSide: BorderSide.none,
                               ),
                               prefix: prefix,
                               prefixIcon: prefixIcon,
                               suffix: suffix,
                               suffixIconConstraints: const BoxConstraints(
                                 minHeight: 32,
                               ),
                               suffixIcon:
                                   suffixIcon ??
                                   (isPassword
                                       ? InkResponse(
                                           onTap: () {
                                             state.onChangeObscureText();
                                           },
                                           radius: 20,
                                           child: Padding(
                                             padding: const EdgeInsets.all(
                                               Dimens.d8,
                                             ),
                                             child: SizedBox(
                                               width: suffixIconSize,
                                               height: suffixIconSize,
                                               child: !state._obscureText
                                                   ? Assets.icons.icEye.svg(
                                                       width: 10,
                                                       height: 10,
                                                     )
                                                   : Assets.icons.icEyeSlash
                                                         .svg(
                                                           width: 10,
                                                           height: 10,
                                                         ),
                                             ),
                                           ),
                                         )
                                       : (isClear && state._isClear)
                                       ? InkResponse(
                                           onTap: () {
                                             state.onClearText();
                                           },
                                           radius: 20,
                                           child: Padding(
                                             padding: const EdgeInsets.all(
                                               Dimens.d8,
                                             ),
                                             child: SizedBox(
                                               width: suffixIconSize,
                                               height: suffixIconSize,
                                               child: Icon(Icons.clear),
                                             ),
                                           ),
                                         )
                                       : suffixIconPath != null
                                       ? InkResponse(
                                           onTap: suffixIconTap,
                                           child: Padding(
                                             padding:
                                                 const EdgeInsets.symmetric(
                                                   horizontal: Dimens.d16,
                                                   vertical: Dimens.d8,
                                                 ),
                                             child: SizedBox(
                                               width: suffixIconSize,
                                               height: suffixIconSize,
                                               child: SvgPicture.asset(
                                                 suffixIconPath,
                                                 colorFilter: ColorFilter.mode(
                                                   hasError
                                                       ? AppColors
                                                             .current
                                                             .errorDefault
                                                       : AppColors
                                                             .current
                                                             .iconOnColor,
                                                   BlendMode.srcIn,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         )
                                       : kSpacingWidth16),
                               enabled: enabled,
                             ),
                       ),
                     ),
                   ),
                   ?widgetRight,
                 ],
               ),
               if (state.errorText != null || errorText != null) ...[
                 kSpacingHeight4,
                 Row(
                   children: [
                     Assets.icons.icDangerCircle.svg(width: 16, height: 16),
                     kSpacingWidth4,
                     Expanded(
                       child: Text(
                         state.errorText ?? errorText!,
                         style: AppTextStyle.regular12(
                           color: errorTextColor ?? AppColors.current.red500,
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
               if (successText != null) ...[
                 kSpacingHeight4,
                 Text(
                   successText,
                   style: AppTextStyle.regular12(
                     color: successTextColor ?? AppColors.current.green500,
                   ),
                 ),
               ],
             ],
           );
         },
       );
  @override
  AppTextFormFieldState createState() => AppTextFormFieldState();
}

class AppTextFormFieldState extends FormFieldState<String> {
  late TextEditingController textEditingController;
  Timer? debounce;
  bool _obscureText = true;

  bool _isClear = false;

  void onChangeObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void onClearText() {
    setState(() {
      textEditingController.clear();
    });
    _isClear = false;
  }

  void _onChangeClear(String? value, [ValueChanged<String?>? onChanged]) {
    _isClear = value?.isNotEmpty ?? false;
  }

  void _onChangeHandler(String? value, [ValueChanged<String?>? onChanged]) {
    didChange(value);
    onChanged?.call(value);
    if (debounce != null) {
      debounce!.cancel();
    }
    debounce = Timer(DurationConstants.defaultTypingActionDelayDuration, () {
      validate();
    });
  }

  @override
  AppTextFormField get widget => super.widget as AppTextFormField;

  @override
  void didUpdateWidget(covariant oldWidget) {
    if (oldWidget.initialValue != widget.initialValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          textEditingController.value = TextEditingValue(
            text: widget.initialValue ?? widget.controller?.text ?? '',
            selection: textEditingController.selection,
          );
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    textEditingController =
        widget.controller ??
        TextEditingController(
          text: widget.initialValue ?? widget.controller?.text ?? '',
        );
    textEditingController.text =
        widget.initialValue ?? widget.controller?.text ?? '';
  }
}
