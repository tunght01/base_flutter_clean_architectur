import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/shared/constants/locale_constants.dart';
import 'package:soft_dream_test/shared/constants/server_request_response_constants.dart';

enum BottomTab { home, notification, profile }

extension BottomTabX on BottomTab {
  Widget get icon {
    switch (this) {
      case BottomTab.home:
        return Icon(Icons.home_outlined);
      case BottomTab.profile:
        return Icon(Icons.account_circle_outlined);
      case BottomTab.notification:
        return Icon(Icons.notifications_outlined);
    }
  }

  Widget get activeIcon {
    switch (this) {
      case BottomTab.home:
        return Icon(Icons.home, color: AppColors.current.primaryDefault);

      case BottomTab.profile:
        return Icon(
          Icons.account_circle_rounded,
          color: AppColors.current.primaryDefault,
        );
      case BottomTab.notification:
        return Icon(
          Icons.notifications,
          color: AppColors.current.primaryDefault,
        );
    }
  }

  String get title {
    switch (this) {
      case BottomTab.home:
        return S.current.home;
      case BottomTab.profile:
        return S.current.profile;
      case BottomTab.notification:
        return S.current.notification;
    }
  }
}

enum InitialAppRoute { login, main }

enum LanguageCode {
  en(
    localeCode: LocaleConstants.en,
    serverValue: ServerRequestResponseConstants.en,
    flag: ServerRequestResponseConstants.enFlag,
  ),
  vi(
    localeCode: LocaleConstants.vi,
    serverValue: ServerRequestResponseConstants.vi,
    flag: ServerRequestResponseConstants.viFlag,
  );

  const LanguageCode({
    required this.localeCode,
    required this.serverValue,
    required this.flag,
  });

  String get title {
    switch (this) {
      case LanguageCode.en:
        return S.current.english;
      case LanguageCode.vi:
        return S.current.vietnamese;
    }
  }

  final String localeCode;
  final String serverValue;
  final String flag;

  static const defaultValue = vi;
}
