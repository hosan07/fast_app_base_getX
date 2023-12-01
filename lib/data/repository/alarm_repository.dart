// import 'package:baseapp_getx/index.dart';
// import 'package:synchronized/synchronized.dart';
//
// part 'alarm_repository.field.dart';
//
// class AlarmRepository extends GetxController {
//   final _lock = Lock();
//   final List alarms = <AlarmField>[].obs;
//
//   final Map<String, MapEntry<String, String>> items = {
//     '': const MapEntry('', ''),
//     '': const MapEntry('', ''),
//   };
//
//   init() => loadPreferences();
//
//   loadPreferences() {
//     _lock.synchronized(() {
//       alarms.clear();
//       final list = prefs.getStringList('alarms_${54321}');
//       for (var text in list ?? []) {
//         alarms.add(AlarmField.fromJson(text));
//       }
//     });
//   }
//
//   Future<void> savePreferences() async {
//     await _lock.synchronized(() async {
//       final list = <String>[];
//       for (var alarm in alarms) {
//         list.add(alarm.toJson());
//       }
//       await prefs.setStringList('alarms_${54321}', list);
//     });
//   }
//
//   Future<void> addAndSave(AlarmField alarm) async {
//     alarms.add(alarm);
//     await savePreferences();
//     await LocalNotification.scheduleAlarmNotification(alarm);
//   }
//
//   Future<bool> removeAndSave(AlarmField alarm) async {
//     if (alarm.on.isTrue) {
//       await LocalNotification.cancel(id: alarm.id);
//     }
//     final result = alarms.remove(alarm);
//     await savePreferences();
//     return result;
//   }
//
//   autoOff() async {
//     var ok = false;
//     final now = DateTime.now();
//     for (AlarmField alarm in alarms) {
//       if (!alarm.oneWeek.contains(true) && alarm.on.isTrue) {
//         // once and on
//         if (now.compareTo(alarm.dateTime) >= 0) {
//           log.info('autoOff alarm = ${alarm.dateTime}');
//           alarm.on(false);
//           ok = true;
//         }
//       }
//     }
//     if (ok) await savePreferences();
//   }
//
//   late int _id;
//   static const int _inc = 20;
//
//   initializeId() {
//     var id = prefs.getInt('alarm_id');
//     if (id != null) {
//       _id = id;
//     } else {
//       _id = DateTime.now().millisecondsSinceEpoch ~/ 1000 * _inc;
//     }
//   }
//
//   Future<int> getId() async {
//     var id = _id;
//     await prefs.setInt('alarm_id', _id += _inc);
//     return id;
//   }
//
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     initializeId();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
// }
