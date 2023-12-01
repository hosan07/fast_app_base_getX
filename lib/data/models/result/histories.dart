import '../field/history.dart';

class HistoriesResult {
  List<HistoryField> histories;
  HistoriesResult({
    required this.histories,
  });

  factory HistoriesResult.fromMap(Map<Object?, dynamic> map) {
    var list = map.entries.map<HistoryField>((e) {
      var history = HistoryField.fromMap(e.value as Map<Object?, dynamic>);
      return history..id = e.key as String;
    }).toList();
    return HistoriesResult(histories: List.from(list));
  }
}
