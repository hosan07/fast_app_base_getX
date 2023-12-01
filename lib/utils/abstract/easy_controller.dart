import 'package:baseapp_getx/index.dart';

abstract class EasyController extends GetxController {
  final absorb = false.obs;
  void absorbing() => absorb(true);
  void tapping() => absorb(false);
}
