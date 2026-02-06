import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_service.dart';

class PushNotificationService {
  final _messaging = FirebaseMessaging.instance;
  final _notificationService = NotificationService();

  Future<void> init() async {
    // Initialize local notification service
    await _notificationService.init();

    // Get device token
    String? token = await _messaging.getToken();
    print('FCM Device Token: $token');

    // Handle background and terminated messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Optional: foreground handled inside NotificationService
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await NotificationService().showNotification(
      message.notification?.title ?? '',
      message.notification?.body ?? '',
    );
  }
}
