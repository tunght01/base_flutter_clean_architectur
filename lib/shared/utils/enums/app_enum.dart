import 'package:flutter/material.dart';

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
