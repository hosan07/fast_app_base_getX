import 'dart:ui';
import 'package:baseapp_getx/index.dart';

class WtTextStyle {
  WtTextStyle._();

  // fontFamily
  // static final String? _fontFamily = isIOS ? ".AppleSystemUIFont" : null;
  // static final List<String>? _fontFamilyFallback = isIOS ? ["Apple SD Gothic Neo"] : null;
  static const String _fontFamily = 'Pretendard';

  static const h1 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 300.0)],
    fontWeight: FontWeight.w400,
    fontSize: 76.0,
    height: 1.0,
    letterSpacing: -1.5,
  );

  static const h1b = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 300.0)],
    fontWeight: FontWeight.w800,
    fontSize: 76.0,

    height: 1.0,
    letterSpacing: 4,
  );


  static const h2 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 300.0)],
    fontWeight: FontWeight.w400,
    fontSize: 70.0,
    height: 1.0,
    letterSpacing: -0.5,
  );

  static const h2b = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 300.0)],
    fontWeight: FontWeight.w700,
    fontSize: 70.0,
    height: 1.0,
    letterSpacing: -0.5,
  );

  static const h3 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 44.0,
    height: 1.0,
    letterSpacing: -0.5,
  );

  static const h3b = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w500,
    fontSize: 46.0,
    height: 1.0,
    letterSpacing: -0.5,
  );

  static const h4 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 38.0,
    height: 1.0,
    letterSpacing: -0.5,
  );

  static const h4b = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w500,
    fontSize: 40.0,
    height: 1.0,
    letterSpacing: -0.5,
  );

  static const h5 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w300,
    fontSize: 28.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h5b = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w600,
    fontSize: 28.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h53 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w600,
    fontSize: 25.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h52 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w400,
    fontSize: 24.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h6 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 500.0)],
    fontWeight: FontWeight.w300,
    fontSize: 21.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h6m = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 500.0)],
    fontWeight: FontWeight.w500,
    fontSize: 21.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h6b = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w600,
    fontSize: 21.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h6bb = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w700,
    fontSize: 22.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h6_5m = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const h6_5 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    height: 1.0,
    letterSpacing: -0.1,
  );


  static const h7m = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 500.0)],
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    height: 1.0,
    letterSpacing: -1,
  );

  static const h7mS = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 500.0)],
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    height: 1.0,
    letterSpacing: 0.2,
  );

  static const h7 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 500.0)],
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    height: 1.0,
    letterSpacing: -1,
  );

  static const h7b2 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    height: 1.0,
    letterSpacing: -0.5
  );

  static const h7b = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    height: 1.0,
    letterSpacing: -1,
  );

  static const hs1 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 600.0)],
    fontWeight: FontWeight.w700,
    fontSize: 17.0,
    height: 1.0,
    letterSpacing: -0.2,
  );

  static const s1 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.0,
    letterSpacing: 0.15,
  );

  static const s1m = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    height: 1.0,
    letterSpacing: -0.1,
  );

  static const s1b = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.0,
    letterSpacing: 0.15,
  );

  static const s2s = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w300,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: 0.1,
  );

  static const s2 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: 0.1,
  );
  static const s2_1 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: -0.5,
  );

  static const s2b = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: 0.1,
  );


  static const b1 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.0,
    letterSpacing: 0.5,
  );

  static const b2 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: 0.25,
  );

  static const button = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 500.0)],
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    height: 1.0,
    letterSpacing: 0.15,
  );

  static const caption = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.0,
    letterSpacing: -0.4,
  );

  static const caption2 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.0,
    letterSpacing: -1
  );


  static const captionb = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    height: 1.0,
    letterSpacing: -0.4,
  );

  static const overline = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 500.0)],
    fontWeight: FontWeight.w400,
    fontSize: 10.0,
    height: 1.0,
    letterSpacing: 0.5,
  );

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /// Weight : Regular(400)
  ///
  /// Size : 30
  static const x__size30 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 30,
    height: 1.0,
    letterSpacing: 1.5,
    textBaseline: TextBaseline.ideographic,
  );

  /// Weight : Regular(400)
  ///
  /// Size : 24
  static const x__size24 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 1.0,
    letterSpacing: 1.2,
  );

  /// Weight : Regular(400)
  ///
  /// Size : 20
  static const x__size20 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 1.0,
    letterSpacing: 1.0,
  );

  /// Weight : Regular(400)
  ///
  /// Size : 16
  static const x__size18 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 1.0,
    letterSpacing: 0.9,
  );

  /// Weight : Regular(400)
  ///
  /// Size : 16
  static const x__size16 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.0,
    letterSpacing: 0.8,
  );

  /// Weight : Regular(400)
  ///
  /// Size : 14
  static const x__size14 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.0,
    letterSpacing: 0.35,
  );

  /// Weight : Regular(400)
  ///
  /// Size : 12
  static const x__size12 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.0,
    letterSpacing: 0.3,
  );

  /// Weight : Regular(400)
  ///
  /// Size : 10
  static const x__size10 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 1.0,
    letterSpacing: 0.25,
  );

  /// Weight : Regular(400)
  ///
  /// Size : 9.3333333
  /// 타이틀에는 1.5배 크게 나오므로 14pt * 2 / 3 = 9.3333333
  static const x__size9 = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 400.0)],
    fontWeight: FontWeight.w400,
    fontSize: 9.3333333,
    height: 1.0,
    letterSpacing: 0.2,
  );

  // Medium(Weight:w500)

  /// Weight : Medium(500)
  ///
  /// Size : 30
  static const x__size30M = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 550.0)],
    fontWeight: FontWeight.w500,
    fontSize: 30,
    height: 1.0,
    letterSpacing: 2.25,
  );

  /// Weight : Medium(500)
  ///
  /// Size : 24
  static const x__size24M = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 550.0)],
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.0,
    letterSpacing: 1.8,
  );

  /// Weight : Medium(500)
  ///
  /// Size : 20
  static const x__size20M = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 550.0)],
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1.0,
    letterSpacing: 1.5,
  );

  /// Weight : Medium(500)
  ///
  /// Size : 16
  static const x__size16M = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 550.0)],
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.0,
    letterSpacing: 1.2,
  );

  /// Weight : Medium(500)
  ///
  /// Size : 14
  static const x__size14M = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 550.0)],
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.0,
    letterSpacing: 0.7,
  );

  /// Weight : Medium(500)
  ///
  /// Size : 12
  static const x__size12M = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 550.0)],
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.0,
    letterSpacing: 0.6,
  );

  /// Weight : Medium(500)
  ///
  /// Size : 10
  static const x__size10M = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 550.0)],
    fontWeight: FontWeight.w500,
    fontSize: 10,
    height: 1.0,
    letterSpacing: 0.5,
  );

  // Bold

  /// Weight : Bold
  ///
  /// Size : 30
  static const x__size30B = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 700.0)],
    fontWeight: FontWeight.w700,
    fontSize: 30,
    height: 1.0,
    letterSpacing: 2.25,
  );

  /// Weight : Bold
  ///
  /// Size : 24
  static const x__size24B = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 700.0)],
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
    letterSpacing: 1.8,
  );

  /// Weight : Bold
  ///
  /// Size : 20
  static const x__size20B = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 700.0)],
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.0,
    letterSpacing: 1.5,
  );

  /// Weight : Bold
  ///
  /// Size : 18
  static const x__size18B = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 700.0)],
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.0,
    letterSpacing: 1.35,
  );

  /// Weight : Bold
  ///
  /// Size : 16
  static const x__size16B = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 700.0)],
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.0,
    letterSpacing: 1.2,
  );

  /// Weight : Bold
  ///
  /// Size : 14
  static const x__size14B = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 700.0)],
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.0,
    letterSpacing: 1.05,
  );

  /// Weight : Bold
  ///
  /// Size : 12
  static const x__size12B = TextStyle(
    fontFamily: _fontFamily,
    // fontVariations: [FontVariation('wght', 700.0)],
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 1.0,
    letterSpacing: 0.9,
  );
}
