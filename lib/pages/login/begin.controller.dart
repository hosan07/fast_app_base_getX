part of 'begin.dart';

class BeginController extends EasyController with GetSingleTickerProviderStateMixin {
  var authStateFailed = false; // false : loading, true : signed out

  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void onInit() async {
    super.onInit();
    //Get.toNamed(Routes.frame);
    animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    Future.delayed(Duration(seconds: 1), () {
      Get.toNamed(Routes.login);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class BeginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BeginController());
  }
}
