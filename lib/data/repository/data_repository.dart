// import 'package:baseapp_getx/data.dart';
// import 'package:baseapp_getx/index.dart';
// import 'package:synchronized/synchronized.dart';
//
// class DataRepository extends GetxController {
//   final _lock = Lock();
//
//   UserInfoResult? userInfo;
//   final userInfoState = Rx<ServiceState>(ServiceState.loading);
//
//   // Future<bool> getUserInfo({bool reload = true}) async {
//   //   return await _lock.synchronized<bool>(() async {
//   //     if (userInfo != null) {
//   //       userInfoState(ServiceState.success);
//   //       return true;
//   //     }
//   //     if (reload) userInfoState(ServiceState.loading);
//   //
//   //     //final result = await fbDatabase.getUserInfo();
//   //     if (result.containsKey('failed')) {
//   //       if (result['failed'] == 'permission-denied') {}
//   //       // 실패
//   //       userInfoState(ServiceState.failed);
//   //       return false;
//   //     } else {
//   //       // 성공
//   //       userInfo = UserInfoResult.fromMap(result);
//   //       userInfoState(ServiceState.success);
//   //       return true;
//   //     }
//   //   });
//   // }
//
//   clear() async {
//     await _lock.synchronized(() {
//       userInfo = null;
//       userInfoState.call(ServiceState.loading);
//     });
//   }
// }
