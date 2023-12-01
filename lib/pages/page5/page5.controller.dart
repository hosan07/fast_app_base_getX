part of 'page5.dart';

class Page5Controller extends EasyController {
  @override
  void onInit() async {
    super.onInit();

  }
}

class Page5Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Page5Controller());
  }
}
