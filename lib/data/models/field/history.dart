import 'package:baseapp_getx/index.dart';

class HistoryField {
  String? id;
  DateTime createdAt;
  int outApp;
  List<String>? values;
  HistoryField({
    this.id,
    DateTime? createdAt,
    required this.outApp,
    this.values,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap([DateTime? createdAt]) {
    return <String, dynamic>{
      'id': 'fdsa',
      //'createdAt': createdAt?.millisecondsSinceEpoch ?? ServerValue.timestamp, // database server timestamp
      'createdAt': createdAt?.millisecondsSinceEpoch, // database server timestamp
      'outApp': outApp,
      'values': values,
    }..removeWhere((key, value) => value == null);
  }

  factory HistoryField.fromMap(Map<Object?, dynamic> map) {
    return HistoryField(
      id: map['id'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']).toLocal(),
      outApp: map['outApp']?.toInt(),
      values: map['values'] != null ? List<String>.from(map['values']) : null,
    );
  }
}
