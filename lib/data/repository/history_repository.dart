// import 'package:baseapp_getx/data.dart';
// import 'package:baseapp_getx/index.dart';
//
// class HistoryRepository extends GetxController {
//   HistoriesResult? histories;
//   var state = ServiceState.loading;
//
//   Future<bool> createHistory(Module module, {int outApp = 0, List<String>? values}) async =>
//       (await fbDatabase.createHistory(module: module.name, outApp: outApp, values: values)) == ServiceState.success;
//
//   Future<void> getHistories(
//     Module module,
//   ) async {
//     histories = null;
//     state = ServiceState.loading;
//     update();
//
//     //xx 제외
//     // await Future.delayed(Duration(seconds: 1));
//     // state = ServiceState.failed;
//     // update();
//     // return;
//     //xx 제외
//
//     final result = await fbDatabase.getHistories(module.name);
//     if (result.containsKey('failed')) {
//       if (result['failed'] == 'permission-denied') {}
//       // 실패
//       histories = null;
//       state = ServiceState.failed;
//     } else {
//       // 성공
//       histories = HistoriesResult.fromMap(result);
//       state = ServiceState.success;
//     }
//     update();
//   }
// }
