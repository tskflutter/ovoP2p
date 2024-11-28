import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ovolutter/data/model/global/response_model/response_model.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/url_container.dart';
import '../../firebase_options.dart';
import 'api_service.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferenceService.setBool(SharedPreferenceService.hasNewNotificationKey, true);
}

class PushNotificationService {
  PushNotificationService();

  Future<void> setupInteractedMessage() async {
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await _requestPermissions();

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {});

    messaging.getToken().then((value) {});
    await enableIOSNotifications();
    await registerNotificationListeners();
  }

  registerNotificationListeners() async {
    AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
    var androidSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSSettings = const DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    var initSettings = InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(initSettings, onDidReceiveNotificationResponse: (message) async {
      try {
        String? payloadString = message.payload is String ? message.payload : jsonEncode(message.payload);
        if (payloadString != null && payloadString.isNotEmpty) {
          Map<dynamic, dynamic> payloadMap = jsonDecode(payloadString);
          Map<String, String> payload = payloadMap.map((key, value) => MapEntry(key.toString(), value.toString()));
          String? remark = payload['for_app'];
          if (remark != null && remark.isNotEmpty) {
            //redirect any specific page
          }
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
      RemoteNotification? notification = message!.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        late BigPictureStyleInformation bigPictureStyle;
        if (android.imageUrl != null) {
          final http.Response response = await http.get(Uri.parse(android.imageUrl!));
          final String localImagePath = await _saveImageLocally(response.bodyBytes);

          bigPictureStyle = BigPictureStyleInformation(
            FilePathAndroidBitmap(localImagePath),
            contentTitle: notification.title,
            summaryText: notification.body,
          );
        }

        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: '@mipmap/ic_launcher',
                playSound: true,
                enableVibration: true,
                enableLights: true,
                fullScreenIntent: true,
                priority: Priority.high,
                styleInformation: android.imageUrl != null ? bigPictureStyle : const BigTextStyleInformation(''),
                importance: Importance.high,
              ),
            ),
            payload: jsonEncode(message.data));
      }
    });
  }

  enableIOSNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  androidNotificationChannel() => const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description: 'This channel is used for important notifications.',
        playSound: true,
        enableVibration: true,
        enableLights: true,
        importance: Importance.high,
      );

  Future<void> _requestPermissions() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation = flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestNotificationsPermission();
    }
  }

  // Function to save the image locally
  Future<String> _saveImageLocally(Uint8List bytes) async {
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/notification_image.png';
    final file = File(imagePath);
    await file.writeAsBytes(bytes);
    return imagePath;
  }

  Future<bool> sendUserToken() async {
    String deviceToken;
    if (SharedPreferenceService.containsKey(SharedPreferenceService.fcmDeviceKey)) {
      deviceToken = SharedPreferenceService.getString(SharedPreferenceService.fcmDeviceKey) ?? '';
    } else {
      deviceToken = '';
    }

    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    bool success = false;
    if (deviceToken.isEmpty) {
      firebaseMessaging.getToken().then((fcmDeviceToken) async {
        success = await sendUpdatedToken(fcmDeviceToken ?? '');
      });
    } else {
      firebaseMessaging.onTokenRefresh.listen((fcmDeviceToken) async {
        if (deviceToken == fcmDeviceToken) {
          success = true;
        } else {
          SharedPreferenceService.setString(SharedPreferenceService.fcmDeviceKey, fcmDeviceToken);
          success = await sendUpdatedToken(fcmDeviceToken);
        }
      });
    }
    return success;
  }

  Future<bool> sendUpdatedToken(String deviceToken) async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.deviceTokenEndPoint}';
    Map<String, String> map = deviceTokenMap(deviceToken);

    ResponseModel model = await ApiService.postRequest(url, map);
    if (model.isSuccess) {
      return true;
    } else {
      return false;
    }
  }

  Map<String, String> deviceTokenMap(String deviceToken) {
    Map<String, String> map = {'token': deviceToken.toString()};
    return map;
  }
}
