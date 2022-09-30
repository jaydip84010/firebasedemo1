import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FireMessaging extends StatefulWidget {
  const FireMessaging({Key? key}) : super(key: key);

  @override
  State<FireMessaging> createState() => _FireMessagingState();
}

class _FireMessagingState extends State<FireMessaging> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  notificationset() async {
    FlutterLocalNotificationsPlugin notificationsPlugin =                               //local notification android and ios both
        await FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings ainit =
        await AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings ios = await DarwinInitializationSettings(
        defaultPresentSound: true,
        defaultPresentAlert: true,
        defaultPresentBadge: true,
        requestAlertPermission: true);
    InitializationSettings initializationSettings =
        InitializationSettings(android: ainit, iOS: ios);
    notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
      },
    );

    notificationsPlugin.show(
        1,
        'bhai bhai',
        'are you ready?',
        NotificationDetails(
            android: AndroidNotificationDetails('1', 'androiddemo',
                channelDescription: "goog",
                importance: Importance.max,
                priority: Priority.high)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              notificationset();
            },
            child: Center(child: Text('press'))),
      )),
    );
  }
}

class PushNotification {
  var title;
  var subtitle;

  PushNotification({this.title, this.subtitle});
}
