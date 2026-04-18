import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
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
        return Icon(Icons.home);

      case BottomTab.profile:
        return Icon(Icons.account_circle_rounded);
      case BottomTab.notification:
        return Icon(Icons.notifications);
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
