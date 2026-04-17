import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:soft_dream_test/domain/usecase/load_initial_resource_use_case.dart';
import 'package:soft_dream_test/presentation/app/my_app.dart';
import 'package:soft_dream_test/shared/helper/run_catching/result.dart';
import 'package:soft_dream_test/shared/helper/run_catching/run_catching.dart';
import 'package:soft_dream_test/shared/utils/log_utils.dart';
import 'config/app_config.dart';
import 'config/app_initializer.dart';
import 'presentation/utils/device_utils.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (DeviceUtils.isMobile()) {
    await Firebase.initializeApp();

    ///IOS Foreground Notification
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
}

void main() => runZonedGuarded(_runMyApp, _reportError);

Future<void> _runMyApp() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  if (DeviceUtils.isMobile()) {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  await AppInitializer(AppConfig.getInstance()).init();
  final initialResource = await _loadInitialResource();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(initialResource: initialResource));
}

void _reportError(Object error, StackTrace stackTrace) {
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');
  if (DeviceUtils.isMobile()) {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}

Future<LoadInitialResourceOutput> _loadInitialResource() async {
  final result = runCatching(
    action: () => GetIt.instance.get<LoadInitialResourceUseCase>().execute(
      const LoadInitialResourceInput(),
    ),
  );

  return result.when(
    success: (output) => output,
    failure: (e) => LoadInitialResourceOutput(),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
