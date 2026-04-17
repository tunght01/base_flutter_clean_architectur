import 'package:flutter/services.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/presentation/utils/device_utils.dart';
import '../presentation/helper/local_push_notification_helper.dart';
import 'config.dart';

class AppConfig implements Config {
  factory AppConfig.getInstance() {
    return _instance;
  }

  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  @override
  Future<void> init() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (DeviceUtils.isMobile()) {
      await getIt.get<LocalPushNotificationHelper>().init();
    }
  }
}
