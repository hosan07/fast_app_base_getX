import 'package:baseapp_getx/index.dart';

/// Android(w400, w500 -> w600)
///
/// iOS(w400, w500)
class WtFontWeight {
  WtFontWeight._();

  static const w400 = FontWeight.w400;
  static final w500 = Platform.isAndroid ? FontWeight.w600 : FontWeight.w500;
}
