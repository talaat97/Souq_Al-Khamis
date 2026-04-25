import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:souq_al_khamis/core/services/notification/notification_ui_service.dart';

class NotificationsHelper {
  static final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
  }

  requestPermissionNotification() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  configFCM() {
    FirebaseMessaging.onMessage.listen((message) {
      if (Get.key.currentContext != null) {
        FlutterRingtonePlayer().playNotification();
        NotificationUIService.showBanner(
          title: message.notification?.title ?? "Notification",
          body: message.notification?.body ?? "",
        );
      }
    });
  }

  // Map<String, dynamic> getBody({
  //   required String fcmToken,
  //   required String title,
  //   required String body,
  //   required String userId,
  //   String? type,
  // }) {
  //   return {
  //     "message": {
  //       "token": fcmToken,
  //       "notification": {
  //         "title": title,
  //         "body": body,
  //       },
  //       "android": {
  //         "notification": {
  //           "notification_priority": "PRIORITY_MAX",
  //           "sound": "default"
  //         }
  //       },
  //       "apns": {
  //         "payload": {
  //           "aps": {"content_available": true}
  //         }
  //       },
  //       "data": {
  //         "type": type,
  //         "id": userId,
  //         "click_action": "FLUTTER_NOTIFICATION_CLICK"
  //       }
  //     }
  //   };
  // }
}
