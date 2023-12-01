part of 'easy_text_button.dart';

//텍스트 버튼 스타일
ButtonStyle get _loginButton => TextButton.styleFrom(
      foregroundColor: WtColors.white,
      minimumSize: const Size(24, 24),
      textStyle: WtTextStyle.h7b,
    );

ButtonStyle get _bodyButton => TextButton.styleFrom(
      foregroundColor: WtColors.b500,
      minimumSize: const Size(24, 24),
      textStyle: WtTextStyle.b2.semibold.copyWith(decoration: TextDecoration.underline),
    );

ButtonStyle get _sheetButton => TextButton.styleFrom(
      foregroundColor: WtColors.b700,
      // backgroundColor: WtColors.b50,
      minimumSize: const Size(32, 32),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      textStyle: WtTextStyle.s1,
    );

ButtonStyle get _agreementButton => TextButton.styleFrom(
      foregroundColor: WtColors.b700,
      minimumSize: const Size(32, 44),
      padding: EdgeInsets.zero,
      textStyle: WtTextStyle.s2,
    ).copyWith(
      overlayColor: materialSolidColor(Colors.transparent),
    );

ButtonStyle get _weatherButton => TextButton.styleFrom(
      foregroundColor: WtColors.b700,
      minimumSize: const Size(32, 24),
      padding: EdgeInsets.zero,
      textStyle: WtTextStyle.s1,
    ).copyWith(
      overlayColor: materialSolidColor(WtColors.b50),
    );

ButtonStyle get _skipButton => TextButton.styleFrom(
      foregroundColor: WtColors.b500,
      minimumSize: const Size(48, 48),
      padding: EdgeInsets.zero,
      textStyle: WtTextStyle.s2.copyWith(fontWeight: FontWeight.w500), // 그냥 medium을 붙이면 web에서 경고!
    ).copyWith(
      overlayColor: materialSolidColor(Colors.transparent),
    );

ButtonStyle get _warningButton => TextButton.styleFrom(
      foregroundColor: WtColors.x__warning,
      textStyle: WtTextStyle.x__size16B,
    ).copyWith(
      overlayColor: materialSolidColor(WtColors.x__warning.withOpacity(0.05)),
    );
