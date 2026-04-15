import 'package:flutter/services.dart';

class UiConstants {
  const UiConstants._();

  /// shimmer
  static const shimmerItemCount = 20;

  /// material app
  static const materialAppTitle = 'XTInvest';
  static const taskMenuMaterialAppColor = Color.fromARGB(255, 153, 154, 251);

  /// orientation
  static const mobileOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  static const tabletOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  /// status bar color
  static const systemUiOverlay = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Color.fromARGB(255, 153, 154, 251),
  );

  static const textFieldTextStyleHeight = 1.3;

  // Banner Constants
  static const bannerDefaultDuration = Duration(seconds: 2);
  static const smartOtpDurationSeconds = 60;
  static const otpDurationSeconds = 300;
  static const otpDurationMinutes = 5;
  static const bannerDefaultHeight = 48.0;
  static const bannerDefaultPadding = 16.0;
  static const bannerDefaultContentPadding = 8.0;
  static const bannerDefaultElevation = 0.0;
  static const bannerDefaultRadius = 12.0;
  //
  static const accountPrefix = '066C';
  static const prefixSymbol = 'TK-';
  static const accountLength = 10;
  static const specialCharacters = '~`!@#\$%^&*()_-+={[}]|:;\'"<,>.?/';

  static const channel = 'M';
}
