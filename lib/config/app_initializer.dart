import 'dart:async';

import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soft_dream_test/di/di.dart' as di;

import 'config.dart';

class AppInitializer {
  AppInitializer(this._applicationConfig);

  final AsyncMemoizer<void> _asyncMemoizer = AsyncMemoizer<void>();
  final Config _applicationConfig;

  Future<void> init() async {
    await _asyncMemoizer.runOnce(() => di.configureInjection());
    await _applicationConfig.init();
  }
}
