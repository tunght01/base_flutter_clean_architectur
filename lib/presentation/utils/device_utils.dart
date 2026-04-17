import 'dart:io';

class DeviceUtils {
  const DeviceUtils._();

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isMobile() {
    return Platform.isIOS || Platform.isAndroid;
  }
}
