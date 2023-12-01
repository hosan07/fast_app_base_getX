// import 'package:baseapp_getx/index.dart';
// import 'package:cron/cron.dart';
//
// part 'weather_repository.aqi.dart';
//
// class WeatherRepository extends GetxController {
//   final _skyTitles = <String>['맑음', '구름조금', '구름많음', '흐림'];
//   final _ptyTitles = <String>['비', '비/눈', '눈', '소나기', '빗방울', '빗방울/눈날림', '눈날림'];
//   final _skyImages = <String>['sky1', 'sky3', 'sky3', 'sky4'];
//   final _ptyImages = <String>['pty1', 'pty2', 'pty3', 'pty1', 'pty5', 'pty6', 'pty7'];
//
//   var cron = Cron();
//   ScheduledTask? scheduledError;
//   ScheduledTask? scheduledSky;
//   ScheduledTask? scheduledWeather;
//   ScheduledTask? scheduledAQI;
//   List<String> region = []; // 날씨 검색 지역
//   List<String> measuring = []; // 관측소 이름
//   String get lastRegion => region.length < 3
//       ? '정보없음'
//       : region[2].isNotEmpty
//           ? region[2]
//           : region[1].isNotEmpty
//               ? region[1]
//               : region[0];
//   String get lastSky => !(okWeather && okSky) ? '---' : (pty > 0 ? _ptyTitles[pty - 1] : _skyTitles[sky - 1]);
//   String get lastImage => !(okWeather && okSky)
//       ? 'assets/png/empty.png'
//       : 'assets/png/wt_${(pty > 0 ? _ptyImages[pty - 1] : _skyImages[sky - 1])}.png';
//
//   Rx<WtStatus> rxSky = Rx<WtStatus>(WtStatus.none);
//   Rx<WtStatus> rxWeather = Rx<WtStatus>(WtStatus.none);
//   Rx<WtStatus> rxAQI = Rx<WtStatus>(WtStatus.none);
//   Rx<WtStatus> rxMeasuring = Rx<WtStatus>(WtStatus.none);
//
//   bool get okSky => rxSky.value == WtStatus.success;
//   bool get okWeather => rxWeather.value == WtStatus.success;
//   bool get okAQI => rxAQI.value == WtStatus.success;
//   bool get noneAQI => rxAQI.value == WtStatus.none;
//   bool get okMeasuring => rxMeasuring.value == WtStatus.success;
//
//   // var wtSky = WtStatus.nothing;
//
//   late DateTime dtSky;
//   late DateTime dtWeather;
//   late DateTime dtAQI;
//   late DateTime dtMeasuring;
//
//   late int sky; // 하늘상태 - 유일하게 초단기예보에서 구함
//   late int reh; // 습도
//   late double t1h; // 기온
//   late int pty; // 강수형태
//
//   Aqi aqi = Aqi();
//
//   int pm10Grade(int pm10Value) => pm10Value < 0
//       ? -1
//       : pm10Value <= 30
//           ? 0
//           : pm10Value <= 80
//               ? 1
//               : pm10Value <= 150
//                   ? 2
//                   : 3;
//   int pm25Grade(int pm25Value) => pm25Value < 0
//       ? -1
//       : pm25Value <= 15
//           ? 0
//           : pm25Value <= 35
//               ? 1
//               : pm25Value <= 75
//                   ? 2
//                   : 3;
//   int _no2Grade(double no2Value) => no2Value.isNaN
//       ? -1
//       : no2Value <= 0.03
//           ? 0
//           : no2Value <= 0.06
//               ? 1
//               : no2Value <= 0.2
//                   ? 2
//                   : 3;
//   int _o3Grade(double o3Value) => o3Value.isNaN
//       ? -1
//       : o3Value <= 0.03
//           ? 0
//           : o3Value <= 0.09
//               ? 1
//               : o3Value <= 0.15
//                   ? 2
//                   : 3;
//   int _coGrade(double coValue) => coValue.isNaN
//       ? -1
//       : coValue <= 2.0
//           ? 0
//           : coValue <= 9.0
//               ? 1
//               : coValue <= 15.0
//                   ? 2
//                   : 3;
//   int _so2Grade(double so2Value) => so2Value.isNaN
//       ? -1
//       : so2Value <= 0.02
//           ? 0
//           : so2Value <= 0.05
//               ? 1
//               : so2Value <= 0.15
//                   ? 2
//                   : 3;
//   int vocGrade(int vocValue) => vocValue < 0
//       ? -1
//       : vocValue == 0
//           ? 0
//           : vocValue == 1
//               ? 1
//               : vocValue == 2
//                   ? 2
//                   : 3;
//
//   @override
//   void onInit() async {
//     super.onInit();
//     await clear();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     cron.close();
//   }
//
//   clear() async {
//     await scheduledError?.cancel();
//     scheduledError = null;
//     await scheduledSky?.cancel();
//     scheduledSky = null;
//     await scheduledWeather?.cancel();
//     scheduledWeather = null;
//     await scheduledAQI?.cancel();
//     scheduledAQI = null;
//     region.clear();
//     measuring.clear();
//
//     rxSky.call(WtStatus.none);
//     rxWeather.call(WtStatus.none);
//     rxAQI.call(WtStatus.none);
//     rxMeasuring.call(WtStatus.none);
//
//     dtSky = DateTime.utc(0);
//     dtWeather = DateTime.utc(0);
//     dtAQI = DateTime.utc(0);
//     dtMeasuring = DateTime.utc(0);
//
//     sky = -1; // 하늘상태
//     reh = -1; // 습도
//     t1h = double.nan; // 기온
//     pty = -1; // 강수형태
//
//     aqi = Aqi();
//   }
//
//   autoData() async {
//     var loadRegion = prefs.getStringList('weather_${54321}');
//     if (loadRegion != null) {
//       await newData(loadRegion);
//     } else {
//       await newData(['서울특별시', '', '', '60', '127', '198167.081', '451261.600']);
//     }
//   }
//
//   newData(List<String>? currentRegion) async {
//     await clear();
//     if ((currentRegion?.length ?? 0) >= 7) {
//       region = List<String>.from(currentRegion!);
//       await prefs.setStringList('weather_${54321}', region); // 서버에도 저장
//
//       getSky();
//       getWeather();
//       getMeasuring();
//
//       // 에러 복구 루틴
//       scheduledError = cron.schedule(Schedule.parse('*/3 * * * *'), errorCorrection);
//     } else {}
//     update();
//   }
//
//   getSky() async {
//     await _modifySky();
//     if (okSky && scheduledSky == null) {
//       scheduledSky = cron.schedule(Schedule.parse('30 40,45,50 * * * *'), _modifySky);
//     }
//   }
//
//   getWeather() async {
//     await _modifyWeather();
//     if (okWeather && scheduledWeather == null) {
//       scheduledWeather = cron.schedule(Schedule.parse('30 */10 * * * *'), _modifyWeather);
//     }
//   }
//
//   autoMeasuring() async {
//     //xx
//     await _modifyMeasuring();
//   }
//
//   getMeasuring() async {
//     await _modifyMeasuring();
//   }
//
//   getAQI() async {
//     await _modifyAQI();
//     if (okAQI && scheduledAQI == null) {
//       scheduledAQI = cron.schedule(Schedule.parse('45 */5 * * * *'), _modifyAQI);
//     }
//   }
//
//   _modifySky() async {
//     if (!(okSky && checkNowSky(dtSky))) {
//       // 기상 sky
//       var items = await weatherService.getUltraShortForecast(nx: region[3], ny: region[4]);
//       if ((items?.length ?? 0) > 0) {
//         for (var item in items!) {
//           if (item['category'] == 'SKY') {
//             var value = int.tryParse(item['fcstValue']) ?? -1;
//             if (value >= 0) {
//               sky = value;
//               dtSky = DateTime.now();
//               rxSky.trigger(WtStatus.success);
//               log.info('WeatherRepository rxSky successful : at ${DateTime.now()}');
//               return;
//             } else {
//               break;
//             }
//           }
//         }
//       }
//       log.warning('WeatherRepository rxSky abnormal : at ${DateTime.now()}');
//       rxSky(sky < 0 ? WtStatus.failed : WtStatus.abnormal);
//     } else {
//       log.info('WeatherRepository rxSky skip!');
//     }
//   }
//
//   _modifyWeather() async {
//     int rehValue = -1; // 습도
//     double t1hValue = double.nan; // 기온
//     int ptyValue = -1; // 강수형태
//
//     // 기상 weather
//     var items = await weatherService.getUltraShortNowcast(nx: region[3], ny: region[4]);
//     if ((items?.length ?? 0) > 0) {
//       for (var item in items!) {
//         if (item['category'] == 'REH') {
//           rehValue = int.tryParse(item['obsrValue']) ?? -1;
//         } else if (item['category'] == 'T1H') {
//           t1hValue = double.tryParse(item['obsrValue']) ?? double.nan;
//         } else if (item['category'] == 'PTY') {
//           ptyValue = int.tryParse(item['obsrValue']) ?? -1;
//         }
//       }
//       if (rehValue >= 0 && t1hValue != double.nan && ptyValue >= 0) {
//         reh = rehValue;
//         t1h = t1hValue;
//         pty = ptyValue;
//         dtWeather = DateTime.now();
//         rxWeather.trigger(WtStatus.success);
//         log.info('WeatherRepository rxWeather successful : at ${DateTime.now()}');
//       } else {
//         log.warning('WeatherRepository rxWeather abnormal : at ${DateTime.now()}');
//         rxWeather(sky < 0 ? WtStatus.failed : WtStatus.abnormal);
//       }
//     }
//   }
//
//   _modifyMeasuring() async {
//     // 관측소(대기질)
//     var items = await weatherService.getNearByMeasuringStation(tmX: region[5], tmY: region[6]);
//     if ((items?.length ?? 0) > 0) {
//       for (var item in items!) {
//         if (item['stationName'] is String) {
//           measuring.add(item['stationName']);
//         }
//       }
//       if (measuring.isNotEmpty) {
//         dtMeasuring = DateTime.now();
//         rxMeasuring(WtStatus.success);
//         log.info('WeatherRepository rxMeasuring successful : at ${DateTime.now()} - $measuring');
//         getAQI();
//       } else {
//         log.warning('WeatherRepository rxMeasuring abnormal : at ${DateTime.now()}');
//         rxMeasuring(WtStatus.failed);
//       }
//     }
//   }
//
//   _modifyAQI() async {
//     if (!(okAQI && checkNowAQI() && checkAQICorrect())) {
//       Aqi aqi = Aqi();
//       bool isConnect = false;
//       DateTime dateTime = dtAQI;
//       for (int i = 0; i < measuring.length; i++) {
//         var stationName = measuring[i];
//         // 대기질
//         var items = await weatherService.getMeasuringStation(stationName: stationName);
//         if ((items?.length ?? 0) > 0) {
//           isConnect = true;
//           var item = items![0]; //! 가장 최근 데이터
//           if (i == 0) {
//             if (item['dataTime'] is String) {
//               //! 여기에서 기지국 장애가 발생하면 시간이 정지된다 .. 어떻게 하면 될까요?
//               if (dtAQI.compareTo(DateTime.utc(0)) != 0 && !checkItemDateAQI(DateTime.parse(item['dataTime']))) {
//                 log.info('WeatherRepository rxAQI skip! (break dateTime!)');
//                 return;
//               }
//               dateTime = DateTime.parse(item['dataTime']);
//             }
//             aqi.time = (item['dataTime'] as String?)?.substring(11);
//           }
//           var pm10Value = int.tryParse(item['pm10Value']) ?? -1;
//           if ((aqi.pm10Value < 0 && pm10Value >= 0) || i == 0) {
//             aqi.pm10Value = pm10Value;
//             aqi.pm10Measuring = i;
//             aqi.pm10Grade = pm10Grade(pm10Value);
//             aqi.pm10Flag = item['pm10Flag'];
//           }
//           var pm25Value = int.tryParse(item['pm25Value']) ?? -1;
//           if ((aqi.pm25Value < 0 && pm25Value >= 0) || i == 0) {
//             aqi.pm25Value = pm25Value;
//             aqi.pm25Measuring = i;
//             aqi.pm25Grade = pm25Grade(pm25Value);
//             aqi.pm25Flag = item['pm25Flag'];
//           }
//           var no2Value = double.tryParse(item['no2Value']) ?? double.nan;
//           if ((aqi.no2Value.isNaN && no2Value >= 0) || i == 0) {
//             aqi.no2Value = no2Value;
//             aqi.no2Measuring = i;
//             aqi.no2Grade = _no2Grade(no2Value);
//             aqi.no2Flag = item['no2Flag'];
//           }
//           var o3Value = double.tryParse(item['o3Value']) ?? double.nan;
//           if ((aqi.o3Value.isNaN && o3Value >= 0) || i == 0) {
//             aqi.o3Value = o3Value;
//             aqi.o3Measuring = i;
//             aqi.o3Grade = _o3Grade(o3Value);
//             aqi.o3Flag = item['o3Flag'];
//           }
//           var coValue = double.tryParse(item['coValue']) ?? double.nan;
//           if ((aqi.coValue.isNaN && coValue >= 0) || i == 0) {
//             aqi.coValue = coValue;
//             aqi.coMeasuring = i;
//             aqi.coGrade = _coGrade(coValue);
//             aqi.coFlag = item['coFlag'];
//           }
//           var so2Value = double.tryParse(item['so2Value']) ?? double.nan;
//           if ((aqi.so2Value.isNaN && so2Value >= 0) || i == 0) {
//             aqi.so2Value = so2Value;
//             aqi.so2Measuring = i;
//             aqi.so2Grade = _so2Grade(so2Value);
//             aqi.so2Flag = item['so2Flag'];
//           }
//
//           if (checkAQIGrade(aqi)) {
//             this.aqi = aqi;
//             dtAQI = dateTime;
//             rxAQI.trigger(WtStatus.success);
//             log.info('WeatherRepository rxAQI successful : at ${DateTime.now()}');
//             return;
//           }
//         }
//       }
//       if (isConnect) {
//         this.aqi = aqi;
//         dtAQI = dateTime;
//         rxAQI.trigger(WtStatus.success);
//         log.info('WeatherRepository rxAQI partially successful : at ${DateTime.now()}');
//       } else {
//         log.warning('WeatherRepository rxAQI abnormal : at ${DateTime.now()}');
//         rxAQI.trigger(WtStatus.abnormal);
//       }
//     } else {
//       log.info('WeatherRepository rxAQI skip!');
//     }
//   }
//
//   errorCorrection() {
//     if (!okSky) {
//       log.severe('WeatherRepository rxSky unsuccessful => execute getSky()');
//       getSky();
//     }
//     if (!okWeather) {
//       log.severe('WeatherRepository rxWeather unsuccessful => execute getWeather()');
//       getWeather();
//     }
//     if (!okMeasuring) {
//       log.severe('WeatherRepository rxMeasuring unsuccessful => execute getMeasuring()');
//       getMeasuring();
//     }
//     if (!okAQI && !noneAQI) {
//       log.severe('WeatherRepository rxAQI unsuccessful => execute getAQI()');
//       getAQI();
//     }
//   }
//
//   bool checkNowSky(DateTime date) {
//     var now = DateTime.now();
//     if (now.minute < 40) now = now.subtract(const Duration(hours: 1));
//     return now.year == date.year && now.month == date.month && now.day == date.day && now.hour == date.hour;
//   }
//
//   bool checkNowAQI() {
//     var now = DateTime.now();
//     if (now.minute < 5) now = now.subtract(const Duration(hours: 1));
//     now = DateTime(now.year, now.month, now.day, now.hour);
//     log.info('now = $now, dtAQI = $dtAQI, status = ${now.compareTo(dtAQI) <= 0}');
//     return now.compareTo(dtAQI) <= 0;
//   }
//
//   bool checkItemDateAQI(DateTime dtItem) {
//     log.info('dtAQI = $dtAQI, dtItem = $dtItem, status = ${dtItem.compareTo(dtAQI) > 0}');
//     return dtItem.compareTo(dtAQI) > 0;
//   }
//
//   bool checkAQIGrade(Aqi aqi) =>
//       aqi.pm10Grade >= 0 &&
//       aqi.pm25Grade >= 0 &&
//       aqi.no2Grade >= 0 &&
//       aqi.o3Grade >= 0 &&
//       aqi.coGrade >= 0 &&
//       aqi.so2Grade >= 0;
//
//   bool checkAQICorrect() =>
//       checkAQIGrade(aqi) &&
//       aqi.pm10Measuring == 0 &&
//       aqi.pm25Measuring == 0 &&
//       aqi.no2Measuring == 0 &&
//       aqi.o3Measuring == 0 &&
//       aqi.coMeasuring == 0 &&
//       aqi.so2Measuring == 0;
// }
