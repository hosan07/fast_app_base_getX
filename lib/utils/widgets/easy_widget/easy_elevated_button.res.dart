part of 'easy_elevated_button.dart';

//각 Elevated 버튼 별 스타일
ButtonStyle get _splashButton => ElevatedButton.styleFrom(
      foregroundColor: WtColors.p100,
      backgroundColor: WtColors.white,
    ).copyWith(
      overlayColor: materialSolidColor(WtColors.l100), //! 임시
    );

ButtonStyle get _loginButton => ElevatedButton.styleFrom(
      minimumSize: const Size(64, 56),
      shape: const RoundedRectangleBorder(),
    );

ButtonStyle get _loginRegularButton => ElevatedButton.styleFrom(
      backgroundColor: WtColors.b700,
      minimumSize: const Size(64, 56),
      shape: const RoundedRectangleBorder(),
    );

ButtonStyle get _smallButton => ElevatedButton.styleFrom(
      minimumSize: const Size(64, 40),
      maximumSize: const Size.fromHeight(40),
    );

ButtonStyle get _regularButton => ElevatedButton.styleFrom(
      backgroundColor: WtColors.b700,
    );

ButtonStyle get _fieldButton => ElevatedButton.styleFrom(
      minimumSize: const Size(64, 47),
    );

ButtonStyle get _cardButton => ElevatedButton.styleFrom(
      foregroundColor: WtColors.b50,
      backgroundColor: WtColors.b700,
      minimumSize: const Size(64, 40),
    );

ButtonStyle get _cardHButton => ElevatedButton.styleFrom(
      foregroundColor: WtColors.b50,
      backgroundColor: WtColors.b700,
      minimumSize: const Size(64, 60),
    );

ButtonStyle get _blueButton => ElevatedButton.styleFrom(
      foregroundColor: WtColors.white,
      backgroundColor: WtColors.p100,
      minimumSize: const Size(64, 30),
      textStyle: WtTextStyle.b2,
      // padding: EdgeInsets.zero,
      shape: const StadiumBorder(),
    );

ButtonStyle get _moduleButton => ElevatedButton.styleFrom(
      foregroundColor: WtColors.b800,
      backgroundColor: WtColors.b50,
      minimumSize: const Size(72, 72),
      textStyle: WtTextStyle.s1b,
    ).copyWith(
      overlayColor: materialSolidColor(WtColors.white.withOpacity(0.3)),
    );
