import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';
import 'package:http/http.dart' as http;
import 'data/services/weather.dart';

class Globals {
  static int gridCrossAxisCount = 0;
  static double? textScaleFactor;
}

late MainController mainController;
FrameController get frameController => Get.find<FrameController>();

// late WeatherService weatherService;
//
// late AlarmRepository alarmRepo; // <== alarm field 관리
// late DataRepository dataRepo;
// //late HistoryRepository historyRepo;
// late RegionRepository regionRepo;
// late WeatherRepository weatherRepo;

late final SharedPreferences prefs;
late final http.Client client;
