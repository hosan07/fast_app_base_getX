part of 'main.dart';

class MainController extends FullLifeCycleController with FullLifeCycleMixin {
  void updateAll() {
    update([]); // 사용된 GetxController를 모두 넣어줍니다.
  }


  void updateScreen(BuildContext context) {
    final width = Get.width;

    // 그리드의 갯수
    var gridCrossAxisCount = 2;
    if (width >= 900) {
      gridCrossAxisCount = 4;
    } else if (width >= 720) {
      gridCrossAxisCount = 4;
    } else if (width >= 540) {
      gridCrossAxisCount = 3;
    }
    Globals.textScaleFactor = width <= 550 ? 1.0 : MediaQuery.of(context).textScaleFactor;

    if (Globals.gridCrossAxisCount != gridCrossAxisCount) {
      Globals.gridCrossAxisCount = gridCrossAxisCount;
      update([HomeController]);
    }
    update([
      BeginController,
    ]);
  }

  @override
  void onInit() {
    super.onInit();
  }

  // Mandatory
  @override
  void onDetached() {
    log.fine('MainController - onDetached called');
  }

  // Mandatory
  @override
  void onInactive() {
    log.fine('MainController - onInactive called');
  }

  // Mandatory
  @override
  void onPaused() {
    log.fine('MainController - onPaused called');
  }

  // Mandatory
  @override
  void onResumed() {
    log.fine('MainController - onResumed called');

    try {
      //alarmRepo.autoOff();
    } catch (e) {
      log.severe(e);
    }
  }

  // Optional
  @override
  Future<bool> didPushRoute(String route) {
    log.finest('MainController - the route $route will be open');
    return super.didPushRoute(route);
  }

  // Optional
  @override
  Future<bool> didPopRoute() {
    log.finest('MainController - the current route will be closed');
    return super.didPopRoute();
  }

  // Optional
  @override
  void didChangeMetrics() {
    log.finest('MainController - the window size did change');
    super.didChangeMetrics();
  }

  // Optional
  @override
  void didChangePlatformBrightness() {
    log.finest('MainController - platform change ThemeMode');
    super.didChangePlatformBrightness();
  }
}

class MainBinding extends Bindings {
  @override
  void dependencies() {
    //* main controller
    //mainController = Get.put(MainController(), permanent: true);
  }
}
