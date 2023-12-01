part of 'page4.dart';

class Page4Controller extends EasyController with GetTickerProviderStateMixin {

  late final TabController tabController; // 콘텐츠 탭 컨트롤러
  RxInt selectedTabIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // 컨트롤러 초기화 시 실행될 코드
    tabController = TabController(initialIndex: 0, length: 2, vsync: this); // 탭 컨트롤러 초기화
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class Page4Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Page4Controller());
  }
}
