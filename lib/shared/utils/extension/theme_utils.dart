import 'package:flutter/material.dart';

extension ThemeModeX on ThemeMode {
  bool get isDarkMode => this == ThemeMode.dark;
  bool get isLightMode => this == ThemeMode.light;
}
