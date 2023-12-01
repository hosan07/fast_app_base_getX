part of 'main.dart';

void setupServices() {
  mainController = Get.put(MainController(), permanent: true);

  // dataRepo = Get.put(DataRepository(), permanent: true);
  //
  // regionRepo = Get.put(RegionRepository(), permanent: true);
  // //날씨
  // weatherRepo = Get.put(WeatherRepository(), permanent: true);
  // weatherService = Get.put(WeatherService(), permanent: true);

}
