import 'package:baseapp_getx/index.dart';

/// GetX에 GetView 대신 사용하는 클래스입니다.
/// MainController가 업데이트될 때 갱신이 됩니다.
abstract class EasyView<T> extends StatelessWidget {
  EasyView({Key? key}) : super(key: key);

  final String? tag = Get.arguments is Map<String, dynamic> ? Get.arguments['tag'] : null;

  T get controller => GetInstance().find<T>(tag: tag)!;
  MainController get mainController => GetInstance().find<MainController>();

  // @override
  Widget build(BuildContext context) => GetBuilder<MainController>(
    id: T,
    builder: (_) => controller is EasyController
        ? Obx(() => AbsorbPointer(absorbing: (controller as EasyController).absorb.value, child: render(context)))
        : render(context),
  );

  Widget render(BuildContext context);
}
