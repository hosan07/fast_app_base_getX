part of 'page2.dart';

class Page2Controller extends EasyController {

  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();

  }
}

class Page2Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Page2Controller());
  }
}
