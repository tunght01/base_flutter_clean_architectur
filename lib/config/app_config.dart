import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }
}
