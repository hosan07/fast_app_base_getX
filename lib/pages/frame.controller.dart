part of 'frame.dart';

class FrameController extends GetxController {
  DateTime? firstTouchTime; // 뒤로가기 버튼 첫번째 누른 시간
  late DateTime secondTouchTime; // 뒤로가기 버튼 두번째 누른 시간

  late PageController pageController;
  final _bottomIndex = 0.obs;
  int get bottomIndex => _bottomIndex.value;
  set bottomIndex(int value) {
    _bottomIndex.value = value;
    pageController.jumpToPage(value);
  }

  StreamController streamController = StreamController<int>();

  @override
  void onInit() async {
    super.onInit();
    log.info('FrameController onInit');
    pageController = PageController(initialPage: 0);
    // await LocalNotification.initialize();

  }

  @override
  void onClose() {
    pageController.dispose();

    super.onClose();
  }
}
class FrameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FrameController());
  }
}
