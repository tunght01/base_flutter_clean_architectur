import 'package:flutter/material.dart';
import 'package:soft_dream_test/shared/constants/locale_constants.dart';
import 'package:soft_dream_test/shared/constants/server_request_response_constants.dart';

enum BottomTab { home, profile }

extension BottomTabX on BottomTab {
  Widget get icon {
    switch (this) {
      case BottomTab.home:
        return Icon(Icons.home);

      case BottomTab.profile:
        return Icon(Icons.account_circle_outlined);
    }
  }

  Widget get activeIcon {
    switch (this) {
      case BottomTab.home:
        return Icon(Icons.home);
      case BottomTab.profile:
        return Icon(Icons.account_circle_outlined);
    }
  }

  String get title {
    switch (this) {
      case BottomTab.home:
        return 'Trang chủ';
      case BottomTab.profile:
        return 'Thông tin';
    }
  }
}
enum InitialAppRoute {
  login,
  main,
}

enum LanguageCode {
  en(
    localeCode: LocaleConstants.en,
    serverValue: ServerRequestResponseConstants.en,
  ),
  vi(
    localeCode: LocaleConstants.vi,
    serverValue: ServerRequestResponseConstants.vi,
  );

  const LanguageCode({required this.localeCode, required this.serverValue});
  final String localeCode;
  final String serverValue;

  static const defaultValue = vi;
}
