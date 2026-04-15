// ignore_for_file: avoid_hard_coded_text_style
import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/dimens/app_dimen.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart' show Dimens;
import 'package:soft_dream_test/presentation/resource/generated/fonts.gen.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';


/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w400Primary

class AppTextStyle {
  AppTextStyle._();
  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    letterSpacing: _defaultLetterSpacing,
    // height: height ?? 1.0,
  );

  static TextStyle custom({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    double fontSize = 10,
    FontWeight? fontWeight,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:
            responsive ? fontSize.responsive(tablet: tablet, ultraTablet: ultraTablet) : fontSize,
        fontWeight: fontWeight,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold60({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d60.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d60,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height ?? 80 / 60,
      ));

  static TextStyle semiBold60({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d60.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d60,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height ?? 80 / 60,
      ));

  static TextStyle medium60({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d60.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d60,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height ?? 80 / 60,
      ));

  static TextStyle regular60({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d60.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d60,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height ?? 80 / 60,
      ));
  static TextStyle semiBold32({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d32.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d32,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold36({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d36.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d36,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold36({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d36.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d36,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium36({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d36.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d36,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular36({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d36.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d36,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold28({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d28.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d28,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold28({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d28.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d28,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium28({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d28.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d28,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular28({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d28.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d28,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold24({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d24.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d24,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold24({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d24.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d24,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium24({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d24.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d24,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular24({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d24.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d24,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold20({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d20.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d20,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold20({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d20.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d20,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium20({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d20.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d20,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular20({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d20.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d20,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold18({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d18.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d18,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold18({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d18.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d18,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium18({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d18.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d18,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular18({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d18.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d18,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold16({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d16,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold16({
    double? tablet,
    double? ultraTablet,
    double? height,
    Color? color,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d16,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium16({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d16,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular16({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d16,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold14({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d14,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold14({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d14,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium14({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d14,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular14({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d14,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold12({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d12.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d12,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold12({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d12.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d12,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium12({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d12.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d12,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular12({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d12.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d12,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle bold10({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d10.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d10,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle semiBold10({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d10.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d10,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle medium10({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d10.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d10,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));

  static TextStyle regular10({
    double? tablet,
    double? ultraTablet,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    bool responsive = true,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: responsive
            ? Dimens.d10.responsive(tablet: tablet, ultraTablet: ultraTablet)
            : Dimens.d10,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.plusJakartaSans,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.textTitle,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: height,
      ));
}
