class AppNotification {
  final String notificationId;
  final String title;
  final String message;

  static const defaultNotificationId = '';
  static const defaultTitle = '';
  static const defaultMessage = '';

  AppNotification({
    this.notificationId = defaultNotificationId,
    this.title = defaultTitle,
    this.message = defaultMessage,
  });
}
