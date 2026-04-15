import 'package:flutter/material.dart';
import 'package:soft_dream_test/config/theme_config.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

enum AppThemeType { dark }

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppColors> _appColorMap = {};

  void addAppColor(AppThemeType type, AppColors appColor) {
    _appColorMap[type] = appColor;
  }

  AppColors get appColor {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ??
        AppColors.defaultAppColor;
  }
}

class AppThemeSetting {
  const AppThemeSetting._();
  static AppThemeType currentAppThemeType = AppThemeType.dark;
}

/// define custom themes here

final darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: ThemeConfig.defaultFontFamily,
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  colorScheme: _darkColorScheme,
  inputDecorationTheme: darkInputDecorationTheme,
  textTheme: darkTextTheme,
  elevatedButtonTheme: darkElevatedButtonThemeData,
  bottomNavigationBarTheme: _darkBottomNavigationBarTheme,
  appBarTheme: _darkAppBarTheme,
  tabBarTheme: _darkTabBarTheme,
  sliderTheme: _darkSliderThemeData,
  cardTheme: _darkCardTheme,
  dropdownMenuTheme: _darkDropdownMenuThemeData,
)..addAppColor(
    AppThemeType.dark,
    AppColors.defaultAppColor,
  );


ColorScheme _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.defaultAppColor.surfacePrimary,
  onPrimary: const Color(0xFF282828),
  secondary: AppColors.defaultAppColor.surfaceSecondary,
  onSecondary: Colors.white,
  error: AppColors.defaultAppColor.errorDark,
  onError: Colors.white,
  surface: AppColors.defaultAppColor.backgroundPrimary,
  onSurface: AppColors.defaultAppColor.backgroundPrimary,
);

///================ BAR DECORATION ===================

/// Dark Bottom Navigation Bar Theme
BottomNavigationBarThemeData _darkBottomNavigationBarTheme =
    const BottomNavigationBarThemeData(
  backgroundColor: Colors.transparent,
  type: BottomNavigationBarType.shifting,
  elevation: 0.0,
  // selectedItemColor: AppColors.primary_01,
  // selectedLabelStyle: AppTextStyle.bottomNavLabel,
  // unselectedItemColor: AppColors.dark_bottom_navigation_bar_unselected,
  // unselectedLabelStyle: AppTextStyle.bottomNavLabel,
);


/// Dark AppBar Theme
AppBarTheme _darkAppBarTheme = AppBarTheme(
  backgroundColor: Colors.transparent,
  elevation: 0.0,
  centerTitle: false,
  titleTextStyle: AppTextStyle.semiBold16(
    color: AppColors.current.textTitle,
  ),
);


/// Dark TabBar Theme
TabBarThemeData _darkTabBarTheme = TabBarThemeData(
  indicator: ShapeDecoration(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.d12))),
    color: AppColors.current.green500,
  ),
  tabAlignment: TabAlignment.start,
  dividerHeight: 0.0,
  // RectangularIndicator(
  //   color: AppColors.current.green500,
  //   bottomLeftRadius: Dimens.d12,
  //   bottomRightRadius: Dimens.d12,
  //   topLeftRadius: Dimens.d12,
  //   topRightRadius: Dimens.d12,
  // ),
  labelPadding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
  labelColor: AppColors.current.textTitle,
  unselectedLabelColor: AppColors.current.textSubTitle,
  labelStyle: AppTextStyle.medium14(
    color: AppColors.current.textTitle,
  ),
  unselectedLabelStyle: AppTextStyle.medium14(
    color: AppColors.current.textSubTitle,
  ),
);

///================ INPUT DECORATION ===================

const InputBorder _defaulBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimens.d12),
  ),
);


final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  filled: true,
  isDense: true,
  fillColor: AppColors.current.neutralBlack1100,
  focusColor: Colors.transparent,
  contentPadding: const EdgeInsets.symmetric(
    horizontal: Dimens.d16,
    vertical: Dimens.d12,
  ),

  // floatingLabelStyle:
  //     AppTextStyle.labelMedium_12.copyWith(color: AppColors.neutral_01),
  hintStyle: AppTextStyle.regular12(),
  border: _defaulBorder,
  enabledBorder: _defaulBorder,
  disabledBorder: _defaulBorder,
  focusedBorder: _defaulBorder.copyWith(
    borderSide:
        const BorderSide(color: Colors.transparent, width: 1),
  ),
  errorBorder: _defaulBorder.copyWith(
    borderSide:
        const BorderSide(color: Colors.transparent, width: 1),
  ),
  focusedErrorBorder: _defaulBorder.copyWith(
    borderSide:
    const BorderSide(color: Colors.transparent, width: 1),
  ),
);

const TextTheme darkTextTheme = TextTheme(
  // bodyLarge: TextStyle(
  //   fontSize: 13,
  //   fontWeight: FontWeight.w400,
  // ),
  // titleMedium: TextStyle(
  //   fontSize: 13,
  //   fontWeight: FontWeight.w400,
  // ),
);


final DropdownMenuThemeData _darkDropdownMenuThemeData = DropdownMenuThemeData(
    textStyle: AppTextStyle.regular14(),
    // menuStyle: MenuStyle(
    //   backgroundColor: WidgetStatePropertyAll(
    //       AppColors.current.surfaceSecondary),
    //   elevation: const WidgetStatePropertyAll(1.0),
    //   shape: WidgetStatePropertyAll(
    //     RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(Dimens.d12),
    //     ),
    //   ),
    //   padding: const WidgetStatePropertyAll(
    //       EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
    //   side: const WidgetStatePropertyAll(BorderSide.none),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: AppColors.current.neutralBlack1100,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        // vertical: Dimens.d8,
      ),
    ));

///================ BUTTON DECORATION ===================
const ElevatedButtonThemeData darkElevatedButtonThemeData =
    ElevatedButtonThemeData(
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
        //     (Set<MaterialState> states) {
        //       if (states.contains(MaterialState.disabled)) {
        //         return AppColors.neutral_03;
        //       }
        //       return AppColors.primary_01;
        //     },
        //   ),
        //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(5),
        //     ),
        //   ),
        // ),
        );
CardThemeData _darkCardTheme = CardThemeData(
  color: AppColors.current.surfaceSecondary.withOpacity(0.06),
  elevation: 0.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
);

///================ SLIDER DECORATION ===================

SliderThemeData _darkSliderThemeData = SliderThemeData(
  activeTrackColor: AppColors.current.surfacePrimary,
  inactiveTrackColor: AppColors.current.surfaceSecondary,
  thumbColor: AppColors.current.surfacePrimary,
  overlayColor: AppColors.current.surfacePrimary,
  valueIndicatorColor: AppColors.current.surfacePrimary,
  valueIndicatorTextStyle: AppTextStyle.medium12(),
);
