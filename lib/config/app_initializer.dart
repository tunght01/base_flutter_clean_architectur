import 'dart:async';

import 'package:async/async.dart';
import 'package:soft_dream_test/di/di.dart' as di;

import 'config.dart';

class AppInitializer {
  AppInitializer(this._applicationConfig);

  final AsyncMemoizer<void> _asyncMemoizer = AsyncMemoizer<void>();
  final Config _applicationConfig;

  Future<void> init() async {
    unawaited(_configFirebase());
    await _asyncMemoizer.runOnce(() => di.configureInjection());
    // await AppConstants.init();
    await _applicationConfig.init();
  }

  Future<void> _configFirebase() async {
    // switch (AppConstants.flavor) {
    //   case Flavor.production:
    //     await Firebase.initializeApp(options: prod_firebase.DefaultFirebaseOptions.currentPlatform);
    //     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    //     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    //   case Flavor.develop:
    //     await Firebase.initializeApp(options: dev_firebase.DefaultFirebaseOptions.currentPlatform);
    //   case Flavor.staging:
    //     await Firebase.initializeApp(options: stg_firebase.DefaultFirebaseOptions.currentPlatform);
    // }
  }
}
