// part of 'alarm_repository.dart';
//
// class AlarmField {
//   final int id;
//   String item;
//   DateTime dateTime;
//   bool sunday;
//   bool monday;
//   bool tuesday;
//   bool wednesday;
//   bool thursday;
//   bool friday;
//   bool saturday;
//   RxBool on;
//   List<bool> get oneWeek => [sunday, monday, tuesday, wednesday, thursday, friday, saturday];
//   set oneWeek(List<bool> list) {
//     sunday = list[0];
//     monday = list[1];
//     tuesday = list[2];
//     wednesday = list[3];
//     thursday = list[4];
//     friday = list[5];
//     saturday = list[6];
//   }
//
//   String get repeat => !oneWeek.contains(false)
//       ? '매일'
//       : (oneWeek.contains(true)
//           ? '매주 ${oneWeek.asMap().entries.map<String>((e) => e.value ? _dayOfWeek[e.key] : '').where((e) => e.isNotEmpty).join(',')}'
//           : '');
//   static const _dayOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
//
//   AlarmField({
//     required this.id,
//     required this.item,
//     required this.dateTime,
//     this.sunday = false,
//     this.monday = false,
//     this.tuesday = false,
//     this.wednesday = false,
//     this.thursday = false,
//     this.friday = false,
//     this.saturday = false,
//     bool on = true,
//   }) : this.on = on.obs;
//
//   AlarmField.week({
//     required this.id,
//     required this.item,
//     required this.dateTime,
//     required List<bool> oneWeek,
//     bool on = true,
//   })  : sunday = oneWeek[0],
//         monday = oneWeek[1],
//         tuesday = oneWeek[2],
//         wednesday = oneWeek[3],
//         thursday = oneWeek[4],
//         friday = oneWeek[5],
//         saturday = oneWeek[6],
//         this.on = on.obs;
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'item': item,
//       'dateTime': dateTime.toUtc().toIso8601String(),
//       'sunday': sunday,
//       'monday': monday,
//       'tuesday': tuesday,
//       'wednesday': wednesday,
//       'thursday': thursday,
//       'friday': friday,
//       'saturday': saturday,
//       'on': on.value,
//     };
//   }
//
//   factory AlarmField.fromMap(Map<String, dynamic> map) {
//     return AlarmField(
//       id: map['id']?.toInt(),
//       item: map['item'],
//       dateTime: DateTime.parse(map['dateTime']).toLocal(),
//       sunday: map['sunday'],
//       monday: map['monday'],
//       tuesday: map['tuesday'],
//       wednesday: map['wednesday'],
//       thursday: map['thursday'],
//       friday: map['friday'],
//       saturday: map['saturday'],
//       on: map['on'] ?? true,
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory AlarmField.fromJson(String source) => AlarmField.fromMap(json.decode(source));
// }
