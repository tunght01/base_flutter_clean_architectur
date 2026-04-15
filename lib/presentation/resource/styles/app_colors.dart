// ignore_for_file: avoid_hard_coded_colors, constant_identifier_names
import 'package:flutter/material.dart';

import 'app_themes.dart';


class AppColors {
  AppColors.darkMode({
    required this.gray1100,
    required this.gray900,
    required this.gray800,
    required this.gray700,
    required this.gray600,
    required this.gray500,
    required this.gray400,
    required this.gray300,
    required this.gray200,
    required this.gray100,
    required this.gray50,
    required this.neutralWhite1100,
    required this.neutralWhite1000,
    required this.neutralWhite900,
    required this.neutralWhite800,
    required this.neutralWhite700,
    required this.neutralWhite600,
    required this.neutralWhite500,
    required this.neutralWhite400,
    required this.neutralWhite300,
    required this.neutralWhite200,
    required this.neutralWhite100,
    required this.neutralWhite50,
    required this.neutralBlack1100,
    required this.neutralBlack1000,
    required this.neutralBlack900,
    required this.neutralBlack800,
    required this.neutralBlack700,
    required this.neutralBlack600,
    required this.neutralBlack500,
    required this.neutralBlack400,
    required this.neutralBlack300,
    required this.neutralBlack200,
    required this.neutralBlack100,
    required this.neutralBlack50,
    required this.blue1000,
    required this.blue900,
    required this.blue800,
    required this.blue700,
    required this.blue600,
    required this.blue500,
    required this.blue400,
    required this.blue300,
    required this.blue200,
    required this.blue100,
    required this.red1000,
    required this.red900,
    required this.red800,
    required this.red700,
    required this.red600,
    required this.red500,
    required this.red400,
    required this.red300,
    required this.red200,
    required this.red100,
    required this.yellow1000,
    required this.yellow900,
    required this.yellow800,
    required this.yellow700,
    required this.yellow600,
    required this.yellow500,
    required this.yellow400,
    required this.yellow300,
    required this.yellow200,
    required this.yellow100,
    required this.green1000,
    required this.green900,
    required this.green800,
    required this.green700,
    required this.green600,
    required this.green500,
    required this.green400,
    required this.green300,
    required this.green200,
    required this.green100,
    required this.purple1000,
    required this.purple900,
    required this.purple800,
    required this.purple700,
    required this.purple600,
    required this.purple500,
    required this.purple400,
    required this.purple300,
    required this.purple200,
    required this.purple100,
    required this.violet1000,
    required this.violet900,
    required this.violet800,
    required this.violet700,
    required this.violet600,
    required this.violet500,
    required this.violet400,
    required this.violet300,
    required this.violet200,
    required this.violet100,
    required this.neutral900,
    required this.neutral800,
    required this.neutral700,
    required this.neutral600,
    required this.neutral500,
    required this.neutral400,
    required this.neutral300,
    required this.neutral200,
    required this.neutral100,
  }) {
    primaryDarker = const Color(0xff032317);
    primaryDark = blue300;
    primaryDefault = blue300;
    primaryLight = const Color(0xcc10a86e);
    primaryLighter = const Color(0x9910a86e);

    /// background
    backgroundPrimary = gray500;
    backgroundCard = const Color(0xff151516);

    /// surface
    surfacePrimary = gray100;
    surfaceSecondary = gray200;
    surfaceTertiary = gray300;
    surfaceQuaternary = gray400;

    /// text
    textTitle = neutralWhite50;
    textBody = neutralWhite100;
    textSubTitle = neutralWhite300;
    textDisable = neutralWhite500;
    textOnColor = neutralWhite50;
    textInverse = neutralBlack50;
    textHyperLink = blue400;

    /// icon
    iconStrong = neutralWhite50;
    iconMedium = neutralWhite100;
    iconSubdued = neutralWhite300;
    iconWeak = neutralWhite500;
    iconOnColor = neutralWhite50;
    iconBlack = neutralBlack50;

    /// stock
    stockTextGreen = const Color(0xff0bdf39);
    stockTextRed = const Color(0xffff0d0d);
    stockTextYellow = yellow500;
    stockTextPurple = violet500;
    stockTextBlue = const Color(0xff52d3f9);


    /// border
    border = const Color(0xff2a2e3b);
    border2 = const Color(0xff2a2e3b);
    border3 = const Color(0xff202020);

    /// information
    informationDarker = const Color(0x1a00c9ff);
    informationDark = blue100;
    informationDefault = blue500;
    informationLight = blue700;
    informationLighter = blue1000;

    /// warning
    warningDarker = const Color(0x1afdff12);
    warningDark = yellow100;
    warningDefault = yellow500;
    warningLight = yellow700;
    yellowLighter = yellow1000;

    /// error
    errorDarker = const Color(0x1aff0017);
    errorDark = red100;
    errorDefault = red500;
    errorLight = red700;
    errorLighter = red1000;

    /// success
    successDarker = const Color(0x1a34c85a);
    successDark = green100;
    successDefault = green500;
    successLight = green700;
    successLighter = green1000;

    /// feature
    featuresDarker = const Color(0x1af23aff);
    featuresDark = violet100;
    featuresDefault = violet500;
    featuresLight = violet700;
    featuresLighter = violet1000;

    /// button
    buttonDefault = const Color(0x0034c85a);
    buttonHover = green500;
    buttonPrimary = const Color(0xff0F6CBD);
    buttonDisable = gray400;
    buttonLighter = violet1000;
    mobileButtonGreen = const Color(0xff2AC281);
    mobileButtonRed = const Color(0xffE94B4F);
    mobileCard1 = const Color(0xff151516);
    mobileCard2 = const Color(0xff232323);
    mobileCard3 = const Color(0xff2E2E34);
    mobileCard4 = const Color(0xff3F3F3F);
    mobileTab = const Color(0xff111111);
    mobileStrokeTab = const Color(0xff202020);
    mobileBackground = const Color(0xff0A0A0B);
    mobileNavigation = const Color(0xff0F0F0F);
    mobileStrokeNavigation = const Color(0xff171717);
    mobileStrokeCard4 = const Color(0xff848484);
    mobileTextDefaultTab = const Color(0xff818181);
    mobileYellow2 = const Color(0xffA7CD0F);
    mobileToastSuccess = const Color(0xff104931);
    mobileToastError = const Color(0xff541515);
    mobileToastWarning = const Color(0xff535415);
    filledColorTextForm = const Color(0x4D000000);
  }

  static AppColors current = defaultAppColor;

  /// gray
  final Color gray1100;
  final Color gray900;
  final Color gray800;
  final Color gray700;
  final Color gray600;
  final Color gray500;
  final Color gray400;
  final Color gray300;
  final Color gray200;
  final Color gray100;
  final Color gray50;

  /// neutrals
  final Color neutralWhite1100;
  final Color neutralWhite1000;
  final Color neutralWhite900;
  final Color neutralWhite800;
  final Color neutralWhite700;
  final Color neutralWhite600;
  final Color neutralWhite500;
  final Color neutralWhite400;
  final Color neutralWhite300;
  final Color neutralWhite200;
  final Color neutralWhite100;
  final Color neutralWhite50;

  final Color neutralBlack1100;
  final Color neutralBlack1000;
  final Color neutralBlack900;
  final Color neutralBlack800;
  final Color neutralBlack700;
  final Color neutralBlack600;
  final Color neutralBlack500;
  final Color neutralBlack400;
  final Color neutralBlack300;
  final Color neutralBlack200;
  final Color neutralBlack100;
  final Color neutralBlack50;

  final Color neutral900;
  final Color neutral800;
  final Color neutral700;
  final Color neutral600;
  final Color neutral500;
  final Color neutral400;
  final Color neutral300;
  final Color neutral200;
  final Color neutral100;

  /// blue
  final Color blue1000;
  final Color blue900;
  final Color blue800;
  final Color blue700;
  final Color blue600;
  final Color blue500;
  final Color blue400;
  final Color blue300;
  final Color blue200;
  final Color blue100;

  /// red
  final Color red1000;
  final Color red900;
  final Color red800;
  final Color red700;
  final Color red600;
  final Color red500;
  final Color red400;
  final Color red300;
  final Color red200;
  final Color red100;

  /// yellow
  final Color yellow1000;
  final Color yellow900;
  final Color yellow800;
  final Color yellow700;
  final Color yellow600;
  final Color yellow500;
  final Color yellow400;
  final Color yellow300;
  final Color yellow200;
  final Color yellow100;

  /// green
  final Color green1000;
  final Color green900;
  final Color green800;
  final Color green700;
  final Color green600;
  final Color green500;
  final Color green400;
  final Color green300;
  final Color green200;
  final Color green100;

  /// purple
  final Color purple1000;
  final Color purple900;
  final Color purple800;
  final Color purple700;
  final Color purple600;
  final Color purple500;
  final Color purple400;
  final Color purple300;
  final Color purple200;
  final Color purple100;

  /// violet
  final Color violet1000;
  final Color violet900;
  final Color violet800;
  final Color violet700;
  final Color violet600;
  final Color violet500;
  final Color violet400;
  final Color violet300;
  final Color violet200;
  final Color violet100;

  /// primary
  late Color primaryDarker;
  late Color primaryDark;
  late Color primaryDefault;
  late Color primaryLight;
  late Color primaryLighter;

  /// background
  late Color backgroundPrimary;
  late Color backgroundCard;

  /// surface
  late Color surfacePrimary;
  late Color surfaceSecondary;
  late Color surfaceTertiary;
  late Color surfaceQuaternary;

  /// text
  late Color textTitle;
  late Color textBody;
  late Color textSubTitle;
  late Color textDisable;
  late Color textOnColor;
  late Color textInverse;
  late Color textHyperLink;

  /// icon
  late Color iconStrong;
  late Color iconMedium;
  late Color iconSubdued;
  late Color iconWeak;
  late Color iconOnColor;
  late Color iconBlack;

  /// stock
  late Color stockTextGreen;
  late Color stockTextRed;
  late Color stockTextYellow;
  late Color stockTextPurple;
  late Color stockTextBlue;


  /// border
  late Color border;
  late Color border2;
  late Color border3;

  /// information
  late Color informationDarker;
  late Color informationDark;
  late Color informationDefault;
  late Color informationLight;
  late Color informationLighter;

  /// warning
  late Color warningDarker;
  late Color warningDark;
  late Color warningDefault;
  late Color warningLight;
  late Color yellowLighter;

  /// error
  late Color errorDarker;
  late Color errorDark;
  late Color errorDefault;
  late Color errorLight;
  late Color errorLighter;

  /// success
  late Color successDarker;
  late Color successDark;
  late Color successDefault;
  late Color successLight;
  late Color successLighter;

  /// feature
  late Color featuresDarker;
  late Color featuresDark;
  late Color featuresDefault;
  late Color featuresLight;
  late Color featuresLighter;

  /// button
  late Color buttonDefault;
  late Color buttonHover;
  late Color buttonPrimary;
  late Color buttonDisable;
  late Color buttonLighter;

  late Color mobileButtonGreen;
  late Color mobileButtonRed;
  late Color mobileCard1;
  late Color mobileCard2;
  late Color mobileCard3;
  late Color mobileCard4;
  late Color mobileTab;
  late Color mobileStrokeTab;
  late Color mobileBackground;
  late Color mobileNavigation;
  late Color mobileStrokeNavigation;
  late Color mobileStrokeCard4;
  late Color mobileTextDefaultTab;
  late Color mobileYellow2;
  late Color mobileToastSuccess;
  late Color mobileToastError;
  late Color mobileToastWarning;
  late Color filledColorTextForm;
  late Color processGreen;

  static final AppColors defaultAppColor = AppColors.darkMode(
    gray1100: const Color(0xff777777),
    gray900: const Color(0xff040405),
    gray800: const Color(0xff060606),
    gray700: const Color(0xff070708),
    gray600: const Color(0xff09090a),
    gray500: const Color(0xff0a0a0b),
    gray400: const Color(0xff3b3b3c),
    gray300: const Color(0xff5b5b5c),
    gray200: const Color(0xff8e8e8f),
    gray100: const Color(0xffb3b3b3),
    gray50: const Color(0xffe7e7e7),
    neutralWhite1100: const Color(0x0affffff),
    neutralWhite1000: const Color(0x12ffffff),
    neutralWhite900: const Color(0x1fffffff),
    neutralWhite800: const Color(0x29ffffff),
    neutralWhite700: const Color(0x33ffffff),
    neutralWhite600: const Color(0x3dffffff),
    neutralWhite500: const Color(0x52ffffff),
    neutralWhite400: const Color(0x7affffff),
    neutralWhite300: const Color(0xa3ffffff),
    neutralWhite200: const Color(0xc2ffffff),
    neutralWhite100: const Color(0xe0ffffff),
    neutralWhite50: const Color(0xffffffff),
    neutralBlack1100: const Color(0x0a000000),
    neutralBlack1000: const Color(0x12000000),
    neutralBlack900: const Color(0x1f000000),
    neutralBlack800: const Color(0x29000000),
    neutralBlack700: const Color(0x33000000),
    neutralBlack600: const Color(0x3d000000),
    neutralBlack500: const Color(0x52000000),
    neutralBlack400: const Color(0x7a000000),
    neutralBlack300: const Color(0xa3000000),
    neutralBlack200: const Color(0xc2000000),
    neutralBlack100: const Color(0xe0000000),
    neutralBlack50: const Color(0xff000000),
    blue1000: const Color(0xffe6faff),
    blue900: const Color(0xffb0eeff),
    blue800: const Color(0xff8ae6ff),
    blue700: const Color(0xff54dbff),
    blue600: const Color(0xff33d4ff),
    blue500: const Color(0xff00c9ff),
    blue400: const Color(0xff00b7e8),
    blue300: const Color(0xff008fb5),
    blue200: const Color(0xff006f8c),
    blue100: const Color(0xff00546b),
    red1000: const Color(0xffffebea),
    red900: const Color(0xfffec2bf),
    red800: const Color(0xfffea5a0),
    red700: const Color(0xfffe7c75),
    red600: const Color(0xfffd625a),
    red500: const Color(0xfffd3b31),
    red400: const Color(0xffe6362d),
    red300: const Color(0xffb42a23),
    red200: const Color(0xff8b201b),
    red100: const Color(0xff6a1915),
    yellow1000: const Color(0xffffffe7),
    yellow900: const Color(0xfffeffb6),
    yellow800: const Color(0xfffeff92),
    yellow700: const Color(0xfffeff60),
    yellow600: const Color(0xfffdff41),
    yellow500: const Color(0xfffdff12),
    yellow400: const Color(0xffe6e810),
    yellow300: const Color(0xffb4b50d),
    yellow200: const Color(0xff8b8c0a),
    yellow100: const Color(0xff6a6b08),
    green1000: const Color(0xffebfaef),
    green900: const Color(0xffc0eecc),
    green800: const Color(0xffa2e6b3),
    green700: const Color(0xff77da90),
    green600: const Color(0xff5dd37b),
    green500: const Color(0xff34c85a),
    green400: const Color(0xff2fb652),
    green300: const Color(0xff258e40),
    green200: const Color(0xff1d6e32),
    green100: const Color(0xff165426),
    purple1000: const Color(0xfff4f3ff),
    purple900: const Color(0xffebe9fe),
    purple800: const Color(0xffd9d6fe),
    purple700: const Color(0xffbdb5fd),
    purple600: const Color(0xff907ef9),
    purple500: const Color(0xff7755ff),
    purple400: const Color(0xff6444e3),
    purple300: const Color(0xff5b27dd),
    purple200: const Color(0xff4b20b8),
    purple100: const Color(0xff2d136c),
    violet1000: const Color(0xfffeebff),
    violet900: const Color(0xfffbc2ff),
    violet800: const Color(0xfff9a4ff),
    violet700: const Color(0xfff67bff),
    violet600: const Color(0xfff561ff),
    violet500: const Color(0xfff23aff),
    violet400: const Color(0xffdc35e8),
    violet300: const Color(0xffac29b5),
    violet200: const Color(0xff85208c),
    violet100: const Color(0xff66186b),
    neutral900: const Color(0xff111111),
    neutral800: const Color(0xff1C1C1C),
    neutral700: const Color(0xff262626),
    neutral600: const Color(0xff303030),
    neutral500: const Color(0xff3B3B3B),
    neutral400: const Color(0xff454545),
    neutral300: const Color(0xff4F4F4F),
    neutral200: const Color(0xff595959),
    neutral100: const Color(0xff636363),
  );

  static List<Color> gradientBorder = const [
    Color(0xb3ff00ff),
    Color(0xb302e56a),
    Color(0xB300FFB2),
    Color(0xb302e56a),
    Color(0xb3ff00ff),
  ];
  static List<Color> gradientProcessNFC = const [
    Color(0xFF163AAE),
    Color(0xFF4B84DF),
    Color(0xFFA4CBFA),
  ];
  static List<Color> gradientProcessNFCUn = const [
    Color(0xFFDBDADC),
    Color(0xFFEAE8EA),
  ];
  static List<Color> bgLogin = const [
    Color.fromRGBO(0, 0, 0, 0.20),
    Color.fromRGBO(0, 0, 0, 0.13),
  ];

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }
}
