import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:greenlife/src/constants/strings.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
late AndroidNotificationChannel channel;

class NotificationService {
  Future<void> init(
    BuildContext context,
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        // do something

      }
    });

    channel = const AndroidNotificationChannel(
      'green-light_notification_channel', // id
      'green-light', // title // description
      importance: Importance.defaultImportance,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // for ios
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // send notification
  Future sendNotification(
      String title, String msg, String pushToken, String routeParam) async {
    //var pushToken = getIt.get<UserStore>().getPushToken();
    var serverKey = Strings.serverKey;
    var headers = {
      'Content-type': 'application/json',
      'Authorization': 'key=$serverKey'
    };
    var request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body = json.encode({
      "notification": {"title": title, "body": ""},
      "data": {
        "route": "$routeParam",
        "sound": "default",
        "status": "done",
        "screen": "screenA",
      },
      "to": pushToken
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var b = await response.stream.bytesToString();
      print(b);
    } else {
      print(response.reasonPhrase);
    }
  }
}
