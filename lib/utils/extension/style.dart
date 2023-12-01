import 'dart:ui';

import 'package:baseapp_getx/index.dart';

extension WtTextStyleExtension on TextStyle {
  /// 스타일 색상 추가
  ///
  /// #FFFFFF
  ///
  /// rgba(255, 255, 255, 1)
  TextStyle get white => copyWith(color: WtColors.white);

  ///스플래쉬 폰트 색
  TextStyle get white1 => copyWith(color: Color(0xFFECF4FD));

  ///ID 찾기, 비밀번호 재설정 폰트 색
  TextStyle get grayscale => copyWith(color: Color(0xFF4C4C4C));

  /// 스타일 색상 추가
  ///
  /// rgba(241, 1)
  TextStyle get b50 => copyWith(color: WtColors.black.shade50);

  /// rgba(230, 1)
  TextStyle get b100 => copyWith(color: WtColors.black.shade100);

  /// rgba(204, 1)
  TextStyle get b200 => copyWith(color: WtColors.black.shade200);

  /// rgba(179, 1)
  TextStyle get b300 => copyWith(color: WtColors.black.shade300);

  /// rgba(153, 1)
  TextStyle get b400 => copyWith(color: WtColors.black.shade400);

  /// rgba(128, 1)
  TextStyle get b500 => copyWith(color: WtColors.black.shade500);

  /// rgba(102, 1)
  TextStyle get b600 => copyWith(color: WtColors.black.shade600);

  /// rgba(76, 1)
  TextStyle get b700 => copyWith(color: Color(0xFF4C4C4C));

  /// rgba(51, 1)
  TextStyle get b800 => copyWith(color: WtColors.black.shade800);

  /// rgba(25, 1)
  TextStyle get b900 => copyWith(color: WtColors.black.shade900);

  /// 스타일 색상 추가
  ///
  /// #000000
  ///
  /// rgba(0, 0, 0, 1)
  TextStyle get black => copyWith(color: WtColors.black);

  /// p100 - #4AA9E3
  //TextStyle get p100 => copyWith(color: WtColors.p100);
  TextStyle get p100 => copyWith(color: Color(0xFF0BB5A0));

  /// p200 - #3272BB
  TextStyle get p200 => copyWith(color: Color(0xFF3272BB));

  /// background - #E9EEF2
  TextStyle get h100 => copyWith(color: WtColors.h100);

  /// background - #E9EEF2
  TextStyle get green => copyWith(color: Color(0xFF41D4A0));

  /// informative - #3279DF
  TextStyle get informative => copyWith(color: WtColors.informative);

  /// negative - #D14C48
  TextStyle get negative => copyWith(color: WtColors.negative);

  /// notice - #E78A2A
  TextStyle get notice => copyWith(color: WtColors.notice);

  /// positive - #3BA876
  TextStyle get positive => copyWith(color: WtColors.positive);

  //xx 삭제요망

  /// 스타일 색상 추가
  ///
  /// #614385
  ///
  /// rgba(97, 67, 133, 1)
  TextStyle get x__violet => copyWith(color: WtColors.x__violet);

  /// 스타일 색상 추가
  ///
  /// #87ABD6
  ///
  /// rgba(135, 171, 214, 1)
  TextStyle get x__indigo => copyWith(color: WtColors.x__indigo);

  /// 스타일 색상 추가
  ///
  /// #15224F
  ///
  /// rgba(21, 34, 79, 1)
  TextStyle get x__subBlue => copyWith(color: WtColors.x__subBlue);

  /// 스타일 색상 추가
  ///
  /// #15224F
  ///
  /// rgba(21, 34, 79, 1)
  TextStyle get x__subBack => copyWith(color: WtColors.x__subBack);

  /// 스타일 색상 추가
  ///
  /// #5F5F5F
  ///
  /// rgba(95, 95, 95, 1)
  TextStyle get x__subDark => copyWith(color: WtColors.x__subDark);

  /// 스타일 색상 추가
  ///
  /// #87ABD6
  ///
  /// rgba(245, 107, 63, 1);
  TextStyle get x__subRed => copyWith(color: WtColors.x__subRed);


  TextStyle get x__subRed2 => copyWith(color: Color(0xFFEA5481));

  /// 스타일 색상 추가
  ///
  /// #E02020
  ///
  /// rgba(224, 32, 32, 1)
  TextStyle get x__warning => copyWith(color: WtColors.x__warning);

  /// 스타일 색상 추가
  ///
  /// #2D2D2D
  ///
  /// rgba(45, 45, 45, 1)
  TextStyle get x__grey0 => copyWith(color: WtColors.x__grey0);

  /// #909090
  TextStyle get x__grey6 => copyWith(color: Color(0xFF909090));

  /// #ABABAB
  TextStyle get x__grey7 => copyWith(color: Color(0xFFABABAB));

  /// #666666
  TextStyle get x__grey8 => copyWith(color: Color(0xFF666666));


  /// 스타일 색상 추가
  ///
  /// #8F8F8F
  ///
  /// rgba(143, 143, 143, 1)
  TextStyle get x__grey1 => copyWith(color: WtColors.x__grey1);

  /// 스타일 색상 추가
  ///
  /// #B7B7B7
  ///
  /// rgba(183, 183, 183, 1)
  TextStyle get x__grey2 => copyWith(color: WtColors.x__grey2);

  /// 스타일 색상 추가
  ///
  /// #D8D8D8
  ///
  /// rgba(216, 216, 216, 1)
  TextStyle get x__grey3 => copyWith(color: WtColors.x__grey3);

  /// 스타일 색상 추가
  ///
  /// #EFEFEF
  ///
  /// rgba(239, 239, 239, 1)
  TextStyle get x__grey4 => copyWith(color: WtColors.x__grey4);

  /// 스타일 색상 추가
  ///
  /// #F8F8F8
  ///
  /// rgba(248, 248, 248, 1)
  TextStyle get x__grey5 => copyWith(color: WtColors.x__grey5);

  /// #B5B5B5
  TextStyle get x__grey9 => copyWith(color: Color(0xFFB5B5B5));

  /// #585858
  TextStyle get x__grey10 => copyWith(color: Color(0xFF585858));

  /// #2E2E2E
  TextStyle get x__grey11 => copyWith(color: Color(0xFF2E2E2E));

  /// #818181
  TextStyle get x__grey12 => copyWith(color: Color(0xFF818181));

  /// #D5D5D5
  TextStyle get x__grey13 => copyWith(color: Color(0xFFD5D5D5));

  /// #1B1B1B
  TextStyle get x__grey14 => copyWith(color: Color(0xFF1B1B1B));

  /// #333333
  TextStyle get x__grey15 => copyWith(color: Color(0xFF333333));

  /// #252525
  TextStyle get x__grey16 => copyWith(color: Color(0xFF252525));

  /// #B3B3B3
  TextStyle get x__grey17 => copyWith(color: Color(0xFFB3B3B3));



  /// #0084FF
  ///
  /// rgba(0, 132, 255, 1)
  TextStyle get x__link => copyWith(color: WtColors.x__link);

  /// #907BAA
  ///
  /// rgba(144, 123, 170, 1)
  TextStyle get x__fabs => copyWith(color: WtColors.x__fabs);

  /// #469C51
  ///
  /// rgba(70, 156, 81, 1)
  TextStyle get x__join => copyWith(color: WtColors.x__join);

  /// #FCE9E9
  ///
  /// rgba(252, 233, 233, 1)
  TextStyle get x__etc1 => copyWith(color: WtColors.x__etc1);

  /// #E9F8EF
  ///
  /// rgba(233, 248, 239, 1)
  TextStyle get x__etc2 => copyWith(color: WtColors.x__etc2);

  /// #7FDA4A
  ///
  /// rgba(127, 218, 74, 1)
  TextStyle get x__right => copyWith(color: WtColors.x__right);

  /// 문자열 높이 조절
  ///
  /// height 1.0
  TextStyle get h1_0 => copyWith(height: 1.0);

  /// 문자열 높이 조절
  ///
  /// height 1.4
  TextStyle get h1_4 => copyWith(height: 1.41667);

  /// 문자열 높이 조절
  ///
  /// height 1.5
  TextStyle get h1_5 => copyWith(height: 1.5);

  /// 문자열 높이 조절
  ///
  /// height 1.7
  TextStyle get h1_7 => copyWith(height: 1.7142857);

  /// 문자열 높이 조절
  ///
  /// height 2.0
  TextStyle get h2_0 => copyWith(height: 2.0);

  /// 문자열 높이 조절
  ///
  /// regular
  TextStyle get regular => copyWith(fontWeight: WtFontWeight.w400);

  /// 문자열 높이 조절
  ///
  /// medium
  TextStyle get medium => copyWith(fontWeight: WtFontWeight.w500);

  /// 문자열 높이 조절
  ///
  /// semibold
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);
}
