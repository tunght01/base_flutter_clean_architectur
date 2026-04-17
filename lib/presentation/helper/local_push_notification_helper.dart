import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/entities/app_notification.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/shared/mixin/log_mixin.dart';

import '../app/bloc/app_event.dart';

@LazySingleton()
class LocalPushNotificationHelper with LogMixin {
  static const _channelId = 'softdream-test';
  static const _channelName = 'softdream-test';
  static const _channelDescription = 'com.example.soft_dream_test';
  static const _androidDefaultIcon = '@mipmap/ic_launcher';
  static const _bitCount = 31;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  int get _randomNotificationId => Random().nextInt(pow(2, _bitCount).toInt() - 1);

  Future<void> init() async {
    /// Initialize the plugin
    /// Change icon at android\app\src\main\res\drawable\app_icon.png
    const androidInit = AndroidInitializationSettings(_androidDefaultIcon);

    /// don't request permission here
    /// we use firebase_messaging package to request permission instead
    const iOSInit = DarwinInitializationSettings(requestAlertPermission: false, requestBadgePermission: false, requestSoundPermission: false);
    const init = InitializationSettings(android: androidInit, iOS: iOSInit);

    /// init local notification
    await Future.wait([
      FlutterLocalNotificationsPlugin().initialize(
        settings: init,
        // TODO: handle later: onSelectNotification: _onSelectNotification,
      ),
    ]);

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(const AndroidNotificationChannel(_channelId, _channelName, description: _channelDescription, importance: Importance.max));

    await initializeMessaging();
    requestPermissions();
  }

  Future<RemoteMessage?> getInitialMessage() {
    return firebaseMessaging.getInitialMessage();
  }

  Future<void> initializeMessaging() async {
    await firebaseMessaging.getInitialMessage().then((RemoteMessage? message) async {
      if (message != null) {
        if (getIt.get<AppBloc>().state.isLoggedIn) {
          handleNotification(message);
        } else {
          getIt.get<AppBloc>().add(SetRemoteMessage(message));
        }
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final RemoteNotification? notification = message.notification;
      handleNotification(message);
      notify(AppNotification(title: notification?.title ?? '', message: notification?.body ?? '', notificationId: message.messageId ?? ''));
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (getIt.get<AppBloc>().state.isLoggedIn) {
        handleNotification(message);
      } else {
        getIt.get<AppBloc>().add(SetRemoteMessage(message));
      }
    });
  }

  Future<void> handleNotification(RemoteMessage message) async {
    if (getIt.get<AppBloc>().state.isLoggedIn) {
      getIt.get<AppBloc>().add(const IsGoToNotifyChangedEvent(isGotoNotidy: true));
    }
  }

  Future<void> notify(AppNotification notification) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(_channelId, _channelName, channelDescription: _channelDescription, priority: Priority.max, importance: Importance.max, enableLights: true, icon: _androidDefaultIcon);
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails(interruptionLevel: InterruptionLevel.timeSensitive, presentSound: true, presentList: true, presentAlert: true, presentBadge: true, presentBanner: true);

    final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    await FlutterLocalNotificationsPlugin()
        .show(
          id: _randomNotificationId,
          title: notification.title,
          body: notification.message,
          notificationDetails: platformChannelSpecifics,
          // TODO: handle later payload: jsonEncode(data),
        )
        .onError((error, stackTrace) => logE('Can not show notification cause $error'));
  }

  Future<String> getToken() {
    return firebaseMessaging.getToken().then((String? token) {
      if (token == null) {
        return '';
      }
      logD('FirebaseToken: $token');
      return token;
    });
  }

  void requestPermissions() {
    FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(alert: true, badge: true, sound: true);

    firebaseMessaging.requestPermission(provisional: true);
  }
}
