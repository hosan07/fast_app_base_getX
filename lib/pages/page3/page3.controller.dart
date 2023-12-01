part of 'page3.dart';

class Page3Controller extends EasyController with GetTickerProviderStateMixin {

  @override
  void onInit() {
    // 컨트롤러 시작 시 실행될 코드
    super.onInit();
  }


  @override
  void onClose() {
    // 컨트롤러 종료 시 실행될 코드
    super.onClose();

  }
}

class Page3Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Page3Controller());
  }
}
