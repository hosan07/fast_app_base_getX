import 'package:baseapp_getx/index.dart';

class WeatherService extends GetxService {
  @override
  void onInit() {
    super.onInit();
  }

  Future<List?> getNearByMeasuringStation({required String tmX, required String tmY}) async {
    var uri =
        'http://apis.data.go.kr/B552584/MsrstnInfoInqireSvc/getNearbyMsrstnList?serviceKey=$openApiServiceKeyE&returnType=json&tmX=$tmX&tmY=$tmY';
    final url = Uri.parse(uri);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes))['response'];
        if ((result['header']?['resultCode'] == '200' || result['header']?['resultCode'] == '00') &&
            result['header']?['resultMsg'] == 'NORMAL_CODE') {
          return result['body']?['items'];
        }
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<List?> getMeasuringStation({required String stationName}) async {
    var uri =
        'http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?serviceKey=$openApiServiceKeyE&returnType=json&numOfRows=100&dataTerm=DAILY&stationName=$stationName&ver=1.0';
    final url = Uri.parse(uri);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes))['response'];
        if ((result['header']?['resultCode'] == '200' || result['header']?['resultCode'] == '00') &&
            result['header']?['resultMsg'] == 'NORMAL_CODE') {
          return result['body']?['items'];
        }
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<List?> getUltraShortNowcast({required String nx, required String ny}) async {
    var now = DateTime.now();
    if (now.minute < 40) now = now.subtract(const Duration(hours: 1));
    var date = DateFormat('yyyyMMdd').format(now);
    var time = DateFormat('HH00').format(now);
    var uri =
        'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=$openApiServiceKeyE&dataType=json&numOfRows=100&base_date=$date&base_time=$time&nx=$nx&ny=$ny';
    final url = Uri.parse(uri);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes))['response'];
        if ((result['header']?['resultCode'] == '200' || result['header']?['resultCode'] == '00') &&
            result['header']?['resultMsg'] == 'NORMAL_SERVICE') {
          return result['body']?['items']?['item'];
        }
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<List?> getUltraShortForecast({required String nx, required String ny}) async {
    var now = DateTime.now();
    if (now.minute < 40) now = now.subtract(const Duration(hours: 1));
    var date = DateFormat('yyyyMMdd').format(now);
    var time = DateFormat('HH30').format(now);
    var uri =
        'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?serviceKey=$openApiServiceKeyE&dataType=json&numOfRows=100&base_date=$date&base_time=$time&nx=$nx&ny=$ny';
    final url = Uri.parse(uri);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes))['response'];
        if ((result['header']?['resultCode'] == '200' || result['header']?['resultCode'] == '00') &&
            result['header']?['resultMsg'] == 'NORMAL_SERVICE') {
          return result['body']?['items']?['item'];
        }
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
