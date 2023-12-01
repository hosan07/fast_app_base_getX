// import 'package:baseapp_getx/data.dart';
// import 'package:baseapp_getx/index.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'dart:developer' as developer;
//
// class LocalNotification {
//   LocalNotification._();
//
//   static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   static final StreamController<ReceivedNotification> _notificationStreamController1 =
//   StreamController<ReceivedNotification>.broadcast();
//   static final StreamController<ReceivedNotification> _notificationStreamController2 =
//   StreamController<ReceivedNotification>.broadcast();
//
//
//   // Stream for listening to notifications
//   static Stream<ReceivedNotification> get onNotification1 => _notificationStreamController1.stream;
//   static Stream<ReceivedNotification> get onNotification2 => _notificationStreamController2.stream;
//
//
//   static initialize() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings("drawable/ic_stat_hearing");
//
//     DarwinInitializationSettings initializationSettingsIOS = const DarwinInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//     );
//
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//
//     _configureLocalTimeZone();
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//       onDidReceiveBackgroundNotificationResponse: onDidReceiveNotificationResponse,
//     );
//   }
//   //foregroud 상태(앱이 열린 상태에서 받은 경우)
//   static void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     //! Payload (전송 데이터)를 Stream에 추가합니다.
//     final String payload = notificationResponse.payload ?? "";
//     if (notificationResponse.payload != null ||
//         notificationResponse.payload!.isNotEmpty) {
//       print('FOREGROUND PAYLOAD: $payload');
//       //streamController.add(payload);
//     }
//   }
//   //Background 상태(앱이 닫힌 상태에서 받은 경우
//   static void onBackgroundNotificationResponse() async {
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//     await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     //! 앱이 Notification을 통해서 열린 경우라면 Payload(전송 데이터)를 Stream에 추가합니다.
//     if (notificationAppLaunchDetails?.didNotificationLaunchApp?? false) {
//       String payload =
//           notificationAppLaunchDetails!.notificationResponse?.payload ?? "";
//       print("BACKGROUND PAYLOAD: $payload");
//       //streamController.add(payload);
//     }
//   }
//
//   static _configureLocalTimeZone() {
//     tz.initializeTimeZones();
//   }
//
//   static void requestPermission() {
//     _flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }
//
//   static int badgeCount = 0;
//   static NotificationDetails defaultDetails() {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         "channel id", "channel name",
//         channelDescription: "channel description",
//         importance: Importance.high,
//         priority: Priority.high,
//         showWhen: false);
//
//     return const NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: DarwinNotificationDetails(badgeNumber: 0), //xx badgeNumber 문제
//     );
//   }
//
//   static Future<void> schedules({required AlarmField alarm}) async {
//     if (!alarm.oneWeek.contains(false)) {
//       // everyday
//       var tzDateTime = tz.TZDateTime.from(alarm.dateTime, tz.local);
//       await _flutterLocalNotificationsPlugin.zonedSchedule(
//         alarm.id.toSigned(32),
//         alarmRepo.items[alarm.item]!.key,
//         alarmRepo.items[alarm.item]!.value,
//         tzDateTime,
//         defaultDetails(),
//         uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//         androidAllowWhileIdle: true,
//         matchDateTimeComponents: DateTimeComponents.time,
//       );
//       // Add a log statement to print the notification content
//       developer.log(
//         'Scheduled notification for item ${alarm.item} at ${alarm.dateTime}',
//         name: 'LocalNotification',
//       );
//     } else if (alarm.oneWeek.contains(true)) {
//       // someday
//       DateTime dateTime = alarm.dateTime.add(Duration(days: DateTime.sunday - alarm.dateTime.weekday));
//       var id = alarm.id;
//       for (var day in alarm.oneWeek) {
//         if (day) {
//           var tzDateTime = tz.TZDateTime.from(dateTime, tz.local);
//           await _flutterLocalNotificationsPlugin.zonedSchedule(
//             id.toSigned(32),
//             alarmRepo.items[alarm.item]!.key,
//             alarmRepo.items[alarm.item]!.value,
//             tzDateTime,
//             defaultDetails(),
//             uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//             androidAllowWhileIdle: true,
//             matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
//           );
//         }
//         id++;
//         dateTime = dateTime.add(const Duration(days: 1));
//       }
//       developer.log(
//         'Scheduled notification for item ${alarm.item} at ${alarm.dateTime}',
//         name: 'LocalNotification',
//       );
//     } else {
//       // once
//       await once(alarm: alarm);
//       developer.log(
//         'Notification triggered for item ${alarm.item} at ${DateTime.now()}',
//         name: 'LocalNotification',
//       );
//     }
//   }
//
//   static Future<void> once({required AlarmField alarm}) async {
//     final now = DateTime.now();
//     if (alarm.dateTime.isBefore(now)) {
//       var inDays = now.difference(alarm.dateTime).inDays;
//       // 익일 모드를 켜줍니다.
//       alarm.dateTime = alarm.dateTime.add(Duration(days: inDays + 1));
//     }
//
//     var tzDateTime = tz.TZDateTime.from(alarm.dateTime, tz.local);
//     await _flutterLocalNotificationsPlugin.zonedSchedule(
//       alarm.id.toSigned(32),
//       alarmRepo.items[alarm.item]!.key,
//       alarmRepo.items[alarm.item]!.value,
//       tzDateTime,
//       defaultDetails(),
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true,
//       matchDateTimeComponents: DateTimeComponents.dateAndTime,
//     );
//   }
//
//   static Future<void> cancel({required int id}) async {
//     await _flutterLocalNotificationsPlugin.cancel(id.toSigned(32));
//     await _flutterLocalNotificationsPlugin.cancel((id + 1).toSigned(32));
//     await _flutterLocalNotificationsPlugin.cancel((id + 2).toSigned(32));
//     await _flutterLocalNotificationsPlugin.cancel((id + 3).toSigned(32));
//     await _flutterLocalNotificationsPlugin.cancel((id + 4).toSigned(32));
//     await _flutterLocalNotificationsPlugin.cancel((id + 5).toSigned(32));
//     await _flutterLocalNotificationsPlugin.cancel((id + 6).toSigned(32));
//   }
//
//   static Future<void> scheduleAlarmNotification(AlarmField alarm) async {
//     final itemEntry = alarmRepo.items[alarm.item];
//     if (itemEntry != null) {
//       await _flutterLocalNotificationsPlugin.zonedSchedule(
//         alarm.id.toSigned(32),
//         itemEntry.key,
//         itemEntry.value,
//         tz.TZDateTime.from(alarm.dateTime, tz.local),
//         defaultDetails(),
//         uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//         androidAllowWhileIdle: true,
//         matchDateTimeComponents: DateTimeComponents.dateAndTime,
//       );
//       // _notificationStreamController.add(ReceivedNotification(
//       //   id: alarm.id.toSigned(32),
//       //   title: itemEntry.key,
//       //   body: itemEntry.value,
//       //   time: alarm.dateTime
//       // ));
//       if (alarm.item == '증상 기록 및 처방약') {
//         _notificationStreamController1.add(ReceivedNotification(
//           id: alarm.id.toSigned(32),
//           title: itemEntry.key,
//           body: itemEntry.value,
//           time: alarm.dateTime,
//           seen: false,
//         ));
//       } else if (alarm.item == '기타') {
//         _notificationStreamController2.add(ReceivedNotification(
//           id: alarm.id.toSigned(32),
//           title: itemEntry.key,
//           body: itemEntry.value,
//           time: alarm.dateTime,
//           seen: false,
//         ));
//       }
//       developer.log(
//         'Scheduled notification for item ${alarm.item} at ${alarm.dateTime}',
//         name: 'LocalNotification',
//       );
//     } else {
//       print('Item entry not found for alarm: ${alarm.item}');
//     }
//   }
// }
//
// class ReceivedNotification {
//   final int id;
//   final String title;
//   final String body;
//   final DateTime time;
//   bool seen;
//
//   ReceivedNotification({required this.id, required this.title, required this.body, required this.time, this.seen = false});
// }